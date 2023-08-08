/*
ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

Table: fraud_score
policy_num:
varchar
state:
varchar
claim_cost:
int
fraud_score:
float

policy_num	state	claim_cost	fraud_score
ABCD1027	CA	2663	0.988
ABCD1016	CA	1639	0.964
ABCD1079	CA	4224	0.963
ABCD1081	CA	1080	0.951
ABCD1069	CA	1426	0.948
*/

WITH wb1 AS (
SELECT
    policy_num,
    state,
    claim_cost,
    fraud_score,
    NTILE(20) OVER(PARTITION BY state ORDER BY fraud_score DESC) AS state_perc
FROM fraud_score
)
SELECT
    policy_num,
    state,
    claim_cost,
    fraud_score
FROM wb1
WHERE state_perc = 1;
