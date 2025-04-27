Customer Churn Analysis Using MySQL and Power BI
1. Objective
The primary objective of this project was to analyze customer churn behavior for an e-commerce platform, using a combination of MySQL for backend querying and Power BI for front-end visualization.
The goal was not just to calculate churn percentages, but to deeply understand demographic patterns, user behavior, and spending habits that influence customer retention and churn.

2. Tools and Technologies Used

Tool	Purpose
MySQL	Data storage, cleaning, structured querying
Power BI	Data visualization, storytelling
SQL (DDL + DML)	Backend data preparation and analysis
DAX	Dynamic calculations and KPIs for interactive visuals
3. Dataset Overview
The project utilized a structured relational database comprising four main tables:

subscriptions: Includes information on subscription status and churn flag.

customers: Stores demographic details such as gender, city tier, marital status, and login devices.

orders: Contains transactional information including cashback amounts, number of orders, and coupon usage.

support_tickets: Tracks customer complaints for service quality assessment.

Each table was linked via a common key: CustomerID.

4. SQL Work and Data Preparation
Using MySQL Workbench, the following work was done:

Database Creation: Set up the relational structure ensuring correct primary key and foreign key relationships.

Data Cleaning: Validated that all tables had no duplicates (unique CustomerID) and handled missing values.

Data Analysis Queries:

Computed churn rates by city tier, payment mode, and device type.

Segmented high-risk users based on low satisfaction scores and complaints.

Analyzed cashback behavior trends across churned and retained users.

Investigated order volume and spending patterns leading up to churn.

All SQL queries were modularized under categories like Customer Overview, Demographic & Behavioral Analysis, Miscellaneous Analysis, and Order & Spending Trends.

5. Power BI Dashboard Development
After preparing the cleaned datasets:

Data Model Construction:
Created proper one-to-many relationships between the imported tables, with CustomerID as the primary linking key.

DAX Measures Built:

Churn Rate

Average Satisfaction Score (Churned Users)

High-Risk Users (Low Satisfaction + Churned)

Average Cashback Amount

Rolling Cashback Trend (7-day)

Monthly Churn Growth (Simulated via DaySinceLastOrder)

Slicers and Filters Added: Included slicers for City Tier, Gender, Device Registered, Preferred Payment Mode, and Satisfaction Score for dynamic report exploration.

6. Key Visuals Created

Visual	Description
KPI Cards	Overall churn rate, avg satisfaction score, high-risk user count
Bar Chart	Churn rate across city tiers
Donut Chart	Churn distribution by preferred login device
Stacked Bar	Churn split by gender and payment mode
Matrix Table	Order categories versus satisfaction scores
Line Chart	Simulated monthly churn trend
Risk Segmentation Donut	Distribution of High Risk, Medium Risk, and Low Risk users
7. Business Inferences Drawn
➔ Multi-Device Users Are More Loyal
Customers with multiple registered devices showed a significantly lower churn rate compared to single-device users.
Inference: Encouraging multi-device engagement can strengthen user retention.

➔ Tier 3 Cities Have Higher Churn
Tier 3 city customers churned more despite cashback incentives being similar to other tiers.
Inference: Logistics, service delays, or lack of offerings could be potential pain points in Tier 3 cities.

➔ UPI and Wallet Users Showed Slightly Higher Churn
Payment analysis revealed marginally higher churn among users preferring UPI and wallets compared to credit card users.
Inference: Streamlining renewal/payment processes for UPI/wallet users may reduce friction-driven churn.

➔ Satisfaction Score is a Leading Churn Indicator
Users with a satisfaction score of 2 or lower were highly likely to churn, regardless of cashback or other benefits.
Inference: Early intervention (loyalty bonuses, targeted outreach) for low satisfaction users can prevent churn.

➔ Cashback Correlates With Retention, But Isn’t Everything
While users with higher cashback tended to churn less, cashback alone was not sufficient to retain customers.
Inference: Cashback programs must be paired with strong service, seamless experience, and good support.

➔ Complaints Strongly Predict Churn
A high correlation was observed between support complaints and churn rates.
Inference: A faster, proactive complaint resolution system could reduce churn risk significantly.

8. Conclusion
This project demonstrated that customer churn is not driven by a single factor but rather by a combination of user engagement, payment experience, satisfaction levels, and support interactions.
Through structured SQL querying and advanced Power BI visualizations, I was able to uncover actionable insights that can drive strategic business decisions to improve retention rates, optimize reward programs, and refine customer support operations.
