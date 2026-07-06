Query 1 : Which client has the highest bench cost?

Orenvast Bank	        5805234.85
Brackenfield Bank	5235852.33
Altovex Systems	        4943113.61
Luminae Financial	2521314.39
Zephryn Technologies	2080454.55
Veluxtra Infotech	2057575.78


Finding: USD-billing international clients (Orenvast, Brackenfield, Altovex) which show nearly double the bench cost of INR clients — driven by higher CTC of IT roles deployed there, not longer bench duration.

Query 2: Which clients show the best vs worst billing efficiency — i.e., what % of available working days actually got billed?

Client         Total_Employees Total_Billable_Days Total_Bench_Days Efficiency %
Zephryn Technologies	1036	22214	601	97.37
Luminae Financial	1065	22714	724	96.91
Veluxtra Infotech	946	20175	647	96.89
Brackenfield Bank	1035	22039	754	96.69
Altovex Systems	        971	20656	730	96.59
Orenvast Bank	        1022	21641	860	96.18

"Despite international clients (Orenvast, Brackenfield, Altovex) generating the highest bench costs, all 6 clients maintain billing efficiency above 96% — meaning bench cost is not an operational deployment problem. It is a CTC-driven cost structure issue concentrated in high-salary IT roles deployed to USD clients."
"This suggests bench reduction efforts should focus on minimising CTC commitments for USD-billed roles at the hiring stage, rather than accelerating deployment timelines."


Query 3: How does margin % differ between IT Technical, IT Functional and Non-IT roles?
"Analytical Notes & Assumptions" or "Methodology Notes" — and you write something like this:

"For margin percentage analysis, months with fewer than 15 billable days were excluded from the average margin % calculation, as dividing a near-full-month CTC loss by minimal revenue produces statistically distorted percentages (e.g. -1,150%) that misrepresent the true earning potential of a role. The impact of these bench months is instead captured separately through total_actual_margin_inr, which includes ALL months — billed and bench — to reflect true profitability after bench cost absorption. Both metrics are presented together to give a complete picture."

Findings:
Skill category  avg_margin_pct_when_billed total_actual_margin_inr  total_employees
IT Mid	        31.99	44445930.96	57
IT Junior	31.46	40577175.23	62
IT Functional	30.66	143064763.58	243
SAP/Niche	29.55	21424797.87	27
IT Senior	27.82	30068692.55	48
Non-IT	         9.96	2284594.9	63

Obs 1: Client requirements are higher in IT Functional category which 
confirms that the volume of deployment matters as much as margin% itself. 
This is a category with moderate margin% but highest headcount.

Obs 2: Senior employees demand higher compensation in IT categories and 
the CTC grows faster than bill rates. Clients have a ceiling on what 
they'll pay because of which the margins are lower in this experience band.

Obs 3: Non-IT roles contribute very little to margin despite having 63 
employees due to lesser bill rates and hence lower margins.

Obs 4: IT Mid and IT Junior are the categories with roughly 5-12 LPA CTC 
range where bill rates are competitive and costs are not as high as senior 
levels. These categories are where the company makes its most efficient 
margins.

Recommendation: While IT Functional should remain the core focus given 
its volume and margin contribution, a deeper review of Non-IT roles is 
recommended — specifically whether the revenue generated justifies the 
operational cost of recruiting, onboarding and managing this category, 
or whether those efforts are better directed toward expanding the IT 
talent pool.

Query 4: — Revenue Lost to Bench Cost: Internal vs Client Delay
Business question: What % of revenue is lost specifically to bench cost — and is that loss driven by internal delays (BGV/Documentation pending) or client-side delays?

delay_type	delay_reason	affected_employees	total_bench_cost
Client Delay	Client BGV Delay	70	4326041.72
Client Delay	Client Budget Hold	62	4179723.5
Client Delay	Visa Processing	        68	3941928.05
Client Delay	Role Redefinition	57	2666696.99
Internal Delay	Documentation Pending	58	3655829.56
Internal Delay	Internal Approvals	47	2994022.7

Findings:
1. client vs internal bench cost ratio: Total Client Delay bench cost= ~₹1.51 Crore
Total Internal Delay bench cost= ~₹65 Lakhs
So client delays are causing roughly 2.3x more bench cost than internal delays.
2. Client BGV delay is the biggest client-side problem:
70 employees affected, ₹43.26 Lakhs in bench cost — the highest of all six reasons. This tells the company that clients are slow at completing their own background verification process, which directly delays billing start.
3. Documentation Pending is the bigger internal problem:
58 employees vs 47 for Internal Approvals. The company's document collection process isn't tight enough. Resources are joining without complete documentation, creating avoidable bench days that cost ₹36.5 Lakhs.
4. 257 employees affected by client delays vs 105 by internal delays. Client-side process gaps are 2.4x more widespread. So its suggested that the company can look into the below.

Short term fix is to tighten internal documentation collection before joining date
Longer term fix is "SLA clauses around deployment timelines can be incorporated directly into SOW agreements at the client onboarding stage — ensuring accountability is established before the first resource is deployed."

## Query 5 — Resignation Rate: Bench vs Active Billing
Are employees more likely to resign when they are on bench vs when they are actively billing?

### Part A Result:
During Active Billing    73    96.05%
During Bench              3     3.95%

### Part A Finding:
96% of resignations occur during active billing and only 4% during bench. 
However this is structurally expected — bench periods last only 1-21 days, 
which is shorter than most notice periods (30-90 days in Indian IT staffing). 
Employees also go through rigorous interview processes before joining and are 
unlikely to resign immediately. This metric alone is therefore insufficient 
to measure bench-driven attrition risk.

A more meaningful question is: at which contract milestone do resignations 
peak? Part B explores this.

### Part B — Resignation by Contract Milestone
0-6 Months      2 resignations    1.71%
6-12 Months    67 resignations   57.26%
12-18 Months   48 resignations   41.03%

In the initial 6 months employees are focused and have job security — 
resignation risk is negligible at 1.71%.

The peak resignation window is 6-12 months (57%) — by this point employees 
have sufficient experience and confidence to explore better opportunities, 
and still have enough time before their project ends to make a move.

The 12-18 month spike (41%) is driven by contract uncertainty — employees 
self-protect by securing another role rather than waiting to see if they 
get released or converted to FTE. They'd rather leave on their own terms 
than risk ending up with nothing.

### Recommendation
If employees are informed 2-3 months in advance about their contract 
outcome — whether extension, FTE conversion, or release — resignation 
cases in the 12-18 month window will reduce significantly. Early and 
transparent communication about contract continuity is the single most 
impactful retention lever available to the company.
