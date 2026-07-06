sql-- Query 1: Which client has the highest total bench cost over 2 years?

Select em.client_name,
Sum(mb.bench_cost_inr) AS total_bench_cost
FROM employee_master as em
JOIN monthly_billing as mb on em.employee_id=mb.employee_id
Group BY em.client_name
Order BY total_bench_cost DESC;

query 2: Which clients show the best vs worst billing efficiency — i.e., what % of available working days actually got billed?

SUM(mb.billable_days) AS total_billable_days,
SUM(mb.bench_days) AS total_bench_days,
ROUND(
 SUM(mb.billable_days)* 100.0/ (SUM(mb.billable_days)+ SUM(mb.bench_days)),2) AS billing_efficiency_pct
 FROM monthly_billing AS mb
 JOIN employee_master AS em on mb.employee_id=em.employee_id
 Group BY client_name
 ORDER BY billing_efficiency_pct DESC;
 
Query 3: How does margin % differ between IT Technical, IT Functional and Non-IT roles?

Select em.skill_category,
ROUND(AVG(CASE WHEN mb.margin_pct !=" "
THEN CAST(mb.margin_pct AS REAL) END), 2) AS avg_margin_pct_when_billed,
ROUND(SUM(mb.margin_inr),2) AS total_actual_margin_inr,
count(DISTINCT mb.employee_id) AS total_employees
FROM monthly_billing AS mb
JOIN employee_master AS em ON mb.employee_id= em.employee_id
GROUP BY em.skill_category
ORDER BY avg_margin_pct_when_billed DESC;

Query 4: Business question: What % of revenue is lost specifically to bench cost — and is that loss driven by internal delays (BGV/Documentation pending) or client-side delays?

SELECT
    CASE 
        WHEN ce.remarks IN (
            'Documentation Pending', 
            'Internal Approvals'
        ) 
        THEN 'Internal Delay'
        ELSE 'Client Delay'
    END AS delay_type,
    ce.remarks AS delay_reason,
    COUNT(DISTINCT em.employee_id) AS affected_employees,
    ROUND(SUM(mb.bench_cost_inr), 2) AS total_bench_cost
FROM monthly_billing mb
JOIN employee_master em ON mb.employee_id = em.employee_id
JOIN contract_events ce ON mb.employee_id = ce.employee_id
WHERE mb.bench_days > 0
AND ce.event_type = 'Bench Start'
GROUP BY delay_type, ce.remarks
ORDER BY delay_type, total_bench_cost DESC;

-- Query 5 Part A: Resignation rate during bench vs active billing
-- Finding: Due to short bench duration (1-21 days), resignation during 
-- bench is structurally near-impossible. 96% of resignations happen 
-- during active billing — not because bench is satisfactory, but because 
-- bench periods are too brief for resignation to be practically executed.

SELECT
    billing_status_at_resignation,
    COUNT(*) AS resignations,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS resignation_pct
FROM (
    SELECT
        ce.employee_id,
        ce.event_date AS resignation_date,
        CASE
            WHEN mb.bench_days > 0 THEN 'During Bench'
            ELSE 'During Active Billing'
        END AS billing_status_at_resignation
    FROM contract_events ce
    JOIN monthly_billing mb ON ce.employee_id = mb.employee_id
    WHERE ce.event_type = 'Resigned'
    AND mb.month = CASE CAST(SUBSTR(ce.event_date, 4, 2) AS INTEGER)
        WHEN 1 THEN 'Jan' WHEN 2 THEN 'Feb' WHEN 3 THEN 'Mar'
        WHEN 4 THEN 'Apr' WHEN 5 THEN 'May' WHEN 6 THEN 'Jun'
        WHEN 7 THEN 'Jul' WHEN 8 THEN 'Aug' WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Oct' WHEN 11 THEN 'Nov' WHEN 12 THEN 'Dec'
    END
    AND mb.year = CAST(SUBSTR(ce.event_date, 7, 4) AS INTEGER)
)
GROUP BY billing_status_at_resignation
ORDER BY resignations DESC;


Part B:

SELECT
    CASE
        WHEN CAST(
            (JULIANDAY(
                SUBSTR(res.event_date,7,4)||'-'||
                SUBSTR(res.event_date,4,2)||'-'||
                SUBSTR(res.event_date,1,2)
            ) -
            JULIANDAY(
                SUBSTR(dep.event_date,7,4)||'-'||
                SUBSTR(dep.event_date,4,2)||'-'||
                SUBSTR(dep.event_date,1,2)
            )) AS INTEGER) <= 180
        THEN '0-6 Months (First Contract Period)'
        WHEN CAST(
            (JULIANDAY(
                SUBSTR(res.event_date,7,4)||'-'||
                SUBSTR(res.event_date,4,2)||'-'||
                SUBSTR(res.event_date,1,2)
            ) -
            JULIANDAY(
                SUBSTR(dep.event_date,7,4)||'-'||
                SUBSTR(dep.event_date,4,2)||'-'||
                SUBSTR(dep.event_date,1,2)
            )) AS INTEGER) <= 360
        THEN '6-12 Months (Second Contract Period)'
        ELSE '12-18 Months (Final Contract Period)'
    END AS contract_milestone,
    COUNT(*) AS resignations,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS resignation_pct
FROM contract_events res
JOIN contract_events dep 
    ON res.employee_id = dep.employee_id
    AND dep.event_type = 'Deployed'
WHERE res.event_type = 'Resigned'
GROUP BY contract_milestone
ORDER BY resignations DESC;


Query 6 — USD vs INR Billing Margin Comparison
Business question: How does USD billing margin compare to INR billing margin overall — which billing model is more profitable for the company?

SELECT
    em.billing_currency,
    ROUND(AVG(CASE WHEN mb.margin_pct != ''
    THEN CAST(mb.margin_pct AS REAL) END), 2) AS avg_margin_pct_when_billed,
    ROUND(SUM(mb.margin_inr),2) AS total_actual_margin_inr,
	ROUND(SUM(mb.monthly_revenue_inr), 2) AS total_revenue_inr,
    count(DISTINCT mb.employee_id) AS total_employees
FROM monthly_billing mb
JOIN employee_master em ON mb.employee_id = em.employee_id
GROUP BY em.billing_currency
ORDER BY avg_margin_pct_when_billed DESC;

