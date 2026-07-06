# Resource Deployment Analytics — IT Staffing Case Study

## Business Case
In a people staffing organisation, resources are onboarded and deployed 
to specific client projects. Delays between onboarding and deployment 
create bench costs that directly erode margins. This study analyses 
2 years of resource deployment data across 500 employees to identify:

- Root causes of bench cost
- Revenue leakage at client and skill level
- Billing efficiency across clients
- Attrition patterns during deployment lifecycle

**Goal:** Provide actionable recommendations to reduce time-to-billing 
and improve overall margin.

---
## About The Dataset
This case study uses a synthetic dataset designed and authored by the 
analyst based on 3.5+ years of hands-on Operations and HR experience managing 
resource deployment, billing trackers, client SOWs and HR operations 
in an IT staffing organisation.

The dataset consists of 3 related tables:

| Table | Rows | Description |
|---|---|---|
| Employee Master | 500 | One row per employee — profile, skill, CTC, client |
| Monthly Billing | 6,084 | One row per employee per month — revenue, margin, bench cost |
| Contract Events | 2,481 | One row per lifecycle event — bench, renewal, appraisal, exit |

**Note:** All company and employee names are fictional and do not 
represent any real organisation or individual. Numerical values reflect 
realistic ranges observed in actual IT staffing operations.

---
## Tools Used

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Data cleaning, validation and exploratory analysis |
| **SQL (DB Browser for SQLite)** | Data querying and business analysis |
| **Tableau Public** | Data visualisation and dashboard creation |
| **GitHub** | Version control and portfolio documentation |

---
## Data Model
The dataset follows a relational structure with 3 tables linked by `employee_id`:
```
employee_master (500 rows)
│
├── monthly_billing (6,084 rows)
│     One row per employee per month
│     Links via employee_id
│
└── contract_events (2,481 rows)
One row per lifecycle event
Links via employee_id
```
**Key business rules reflected in the data:**
- Non-IT employees have zero bench days (deployed same day as joining)
- IT employees have 1-21 bench days at joining (rare cases up to 30)
- Bill rates derived from CTC + target margin (not randomly assigned)
- USD billing invoiced monthly at 176 hours (22 days × 8 hours)
- INR billing invoiced monthly at 22 working days
- Exchange rate: ₹83 per USD (fixed for 2023-2024 period)

---
## Key Findings

### Q1 — Bench Cost by Client
International (USD-billed) clients — Orenvast Bank, Brackenfield Bank 
and Altovex Systems — account for the highest bench costs, nearly double 
that of domestic INR clients. This is driven by higher CTC of IT resources 
deployed to international clients, not longer bench durations.

### Q2 — Billing Efficiency by Client
All 6 clients maintain billing efficiency above 96%, confirming that bench 
cost is not an operational deployment problem. It is a CTC-driven cost 
structure issue concentrated in high-salary IT roles deployed to USD clients.

### Q3 — Margin % by Skill Category
IT Mid and IT Junior categories generate the highest margin % (31-32%) — 
the sweet spot where bill rates are competitive but costs haven't escalated 
to senior levels. IT Functional dominates total actual margin through sheer 
volume (243 employees). Non-IT contribution is negligible despite similar 
headcount to other categories.

### Q4 — Bench Cost: Internal vs Client Delay
Client delays drive 2.3x more bench cost (₹1.51 Crore) than internal 
delays (₹65 Lakhs). Client BGV delay is the single biggest cost driver 
affecting 70 employees. Recommended fix: SLA agreements with clients on 
deployment timelines incorporated directly into SOW agreements, alongside 
tighter internal documentation collection before joining date.

### Q5 — Resignation Timing Analysis
57% of resignations occur in the 6-12 month window — employees resign 
once settled and confident enough to explore better opportunities. The 
12-18 month spike (41%) is driven by contract uncertainty — employees 
self-protect by securing another role rather than waiting for contract 
outcome. Early communication of contract decisions (extension, FTE 
conversion or release) can significantly reduce attrition in this window.

### Q6 — USD vs INR Billing Margin
With nearly equal headcount (248 vs 252 employees), USD billing generates 
₹67.7Cr revenue vs ₹24.9Cr for INR — a 2.7x difference. Average margin % 
is 34% for USD vs 22% for INR. International clients deliver significantly 
higher returns per resource deployed and should be the priority segment 
for business expansion.

---
## Dashboards

### Dashboard 1 — Revenue & Efficiency
Visualises bench cost by client, billing efficiency and USD vs INR 
margin comparison.

🔗 [View Dashboard 1 on Tableau Public]
(https://public.tableau.com/views/StaffingAnalyticsCaseStudy/RevenueEfficiency?:language=en-US&publish=yes)

### Dashboard 2 — People & Operations
Visualises margin % by skill category, delay analysis and 
resignation timing patterns.

🔗 [View Dashboard 2 on Tableau Public]
(https://public.tableau.com/app/profile/deepthi.singh.rathod/viz/StaffingAnalyticsCaseStudy/PeopleOperations?publish=yes)

![Dashboard 1 Preview](dashboard/dashboard1_revenue_efficiency.png)
![Dashboard 2 Preview](dashboard/dashboard2_people_operations.png)

---
## Methodology Notes

- **Margin % calculation:** Months with fewer than 15 billable days were 
excluded from average margin % calculations. Dividing a near-full-month 
CTC loss by minimal revenue produces statistically distorted percentages. 
The impact of bench months is captured separately through 
`total_actual_margin_inr` which includes all months.

- **Bench cost classification:** Bench cost is calculated as the 
proportional share of monthly CTC attributable to bench days. It is a 
breakdown of existing cost, not an additional charge.

- **Currency conversion:** All USD billing converted to INR at ₹83 per 
USD (representative rate for 2023-2024 period) for cross-client comparison.

- **Delay classification:** Bench delay reasons classified as Internal 
(Documentation Pending, Internal Approvals) or Client-side (Client BGV 
Delay, Client Budget Hold, Visa Processing, Role Redefinition) based on 
contract events remarks.

- **Resignation analysis:** Bench vs billing resignation comparison was 
structurally limited due to short bench durations (1-21 days) relative 
to notice periods (30-90 days). Analysis was extended to contract 
milestone timing for more meaningful attrition insights.

---
## About The Author

I am an Operations and HR professional with 3.5+ years of experience 
in IT staffing — managing resource deployment, billing trackers, client 
SOWs, project lifecycles and HR operations. I am currently transitioning 
into a Data Analyst role and built this case study to demonstrate 
end-to-end analytical capability using a domain I have worked in firsthand.

**Skills demonstrated in this project:**
- Data modelling and synthetic dataset design from domain knowledge
- Data cleaning and validation in Excel
- SQL querying across multiple related tables (JOINs, aggregations, 
window functions, subqueries)
- Data visualisation and dashboard design in Tableau Public
- Business insight generation and recommendation writing
- Data ethics — transparent disclosure of synthetic data usage

**Connect with me:**
🔗 [LinkedIn](www.linkedin.com/in/deepthisinghrathod)
🔗 [Tableau Public Profile](https://public.tableau.com/app/profile/deepthi.singh.rathod/vizzes)
🔗 [GitHub](https://github.com/Deepthi16-r)

---
*This case study was completed as part of my data analytics portfolio.
Dataset is synthetic and authored by the analyst. All company and 
employee names are fictional.*
