# StreamFlix-Content-Analytics
## Business Context

StreamFlix is a **subscription video-on-demand (SVOD)** platform serving subscribers across **20 countries**. Its catalogue spans **16 genres** — Drama, Comedy, Action, Thriller, Documentary, Animation, Horror, Romance, Sci-Fi, Fantasy, Crime, Kids & Family, Musical, Stand-Up, Reality, and Mystery — across both movies and multi-season series. Subscribers watch on **six device types** — Smart TV, Mobile, Laptop, Tablet, Game Console, and Streaming Stick — and pay on one of **three subscription plans**: Basic with Ads ($6.99), Standard ($15.49), and Premium ($22.99).

<p align="center">
     <img src="reports/figures/StreamFlix.jpg" alt="StreamFlix.jpg" width="700">
</p>

## Business Problem Statement
StreamFlix is currently unable to optimize its content selection, funding allocation, and subscriber retention strategies. This lack of data-backed decision-making has led to misallocated capital investments, declining revenue, and eroded profit margins. To restore growth and enhance subscriber satisfaction, executive leadership requires actionable, data-driven insights to guide content investments and strategic platform decisions.
## Project Obejctives
- Which genres and titles are driving the most watch time, and which are underperforming? 
- Are we losing too many subscribers to churn, and what does an at-risk subscriber look like? 
- Which subscriber segments — by plan, age, and region — are the most valuable and most engaged?
- Are there seasonal viewing patterns we should plan our content releases around? 
- Which countries and languages are our biggest and fastest-growing markets?
- Is our content investment efficient, or are some genres and titles soaking up budget without the watch time to justify it?
## KPI's & Metrics
- Total Watch Hourse
- Active Rate
- Churn Rate
- Average Watch Time / Subscriber
- Watchlist Conversion
- Hit Concentration
- Originals Share of Hours
- Cohort Retention
## Stackholders
- non-technical managers
- Leadership Team
- Project Manager

## Data

The **StreamFlix Content Analytics** project uses a relational dataset consisting of six interconnected tables. The dataset represents subscribers, content, viewing activity, ratings, reviews, and watchlist behavior.

| Table | Records | Description |
|:---|---:|:---|
| `subscribers` | 15,000 | Subscriber profiles, subscription plans, locations, and churn information |
| `titles` | 9,000 | Movie and TV show catalogue with content-related attributes |
| `watch_history` | 650,000 | Individual subscriber viewing sessions and completion activity |
| `ratings` | 130,000 | Ratings provided by subscribers for watched titles |
| `reviews` | 110,000 | Written subscriber reviews and sentiment information |
| `watchlist` | 65,000 | Titles saved by subscribers and their viewing conversion behavior |

## Technology Stack

### Data Analysis

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Lab

### Database

- PostgreSQL
- SQL

### Business Intelligence

- Microsoft Power BI
- Power Query
- DAX

### Development & Version Control

- VS Code
- Git
- GitHub

## 🔄 Project Workflow

```text
Raw Data
   ↓
PostgreSQL – Data Cleaning & SQL Analysis
   ↓
Python – Data Cleaning & Data Quality Checks
   ↓
Exploratory Data Analysis (EDA)
   ↓
KPI Calculation
   ↓
Power BI – Data Modeling
   ↓
Interactive Dashboard
   ↓
Business Insights
```
---

## 1. PostgreSQL — Basic Cleaning & Analysis

### Database & Data Inspection

The initial inspection focused on understanding the structure and contents of each table.

- Inspected sample records using `SELECT ... LIMIT`
- Checked total records in each table
- Identified distinct categorical values
- Examined date ranges
- Checked subscriber activity status
- Reviewed ratings and review attributes
- Inspected viewing-session attributes such as device and completion status
- Validated relationships between subscribers, titles, ratings, reviews, and watch history

### Basic Data Cleaning

Basic cleaning and preparation included:

- Validating column names and data structure
- Renaming columns where required
- Checking categorical values
- Checking rating ranges
- Identifying subscribers without ratings or reviews using `LEFT JOIN`
- Validating relationships between fact and dimension tables
- Checking completion and viewing-related fields
- Preparing tables for analytical queries

### Analytical Questions

After inspection and cleaning, PostgreSQL was used to answer business-oriented questions.

#### Content Performance

- Which genres generate the highest total watch hours?
- Which countries of origin generate the most watch hours?
- Which languages have the highest viewing activity?
- How do Movies and TV Shows compare in watch hours and completion?
- Which genres have the highest completion rates?
- How does engagement vary by content release year?

#### Subscriber & Engagement Analysis

- Which subscription plans have the highest average watch time per subscriber?
- What percentage of subscribers are active vs. inactive?
- What is the subscriber churn rate?
- What is the Monthly Recurring Revenue (MRR)?
- What is the Average Revenue Per User (ARPU)?

#### Viewing Behavior

- Which devices account for the highest share of viewing sessions?
- Which subscriber segments show higher engagement?
- Which genres have the highest number of completed sessions?

#### Customer Experience

- What is the distribution of ratings?
- Which genres and languages receive more positive reviews?
- Which subscribers have not submitted ratings or reviews?

#### Watchlist & Content Investment

- What percentage of saved titles are eventually watched?
- Which genres generate the most watch hours relative to content investment?
- How many watch hours are generated per **$1,000 of licence cost**?


# 2. Data Cleaning & Quality Analysis

The first stage focused on understanding, cleaning, and validating the raw datasets before performing analysis.

### Checks Performed

- Row and column counts
- Data types
- Missing values
- Duplicate records
- Primary key validation
- Referential integrity
- Date validation
- Numeric validation
- Outlier detection
- Business-rule validation

Examples include validating subscriber and title relationships, checking duplicate IDs, validating dates, and verifying completion percentages.

---

# 3. Exploratory Data Analysis

Python was used to explore patterns, trends, and relationships across the datasets.

### Key Analyses

- Monthly viewing volume
- Monthly watch-hours trend
- Watch hours by genre
- Movies vs. TV Shows
- Top countries by watch hours
- Subscriber plan distribution
- Device usage
- Subscriber age distribution
- Completion rate by genre
- Review sentiment analysis

These analyses helped identify important trends and patterns before developing the final dashboard.

---

# 4. Business KPI Analysis

The project includes the following key business metrics:

| KPI | Purpose |
|:---|:---|
| Total Watch Hours | Measures overall platform engagement |
| Active Rate | Measures the proportion of active subscribers |
| Churn Rate | Measures subscriber loss |
| Average Completion Rate | Measures content engagement |
| Monthly Recurring Revenue | Measures recurring subscription revenue |
| ARPU | Measures average revenue per active subscriber |
| Average Watch Time / Subscriber | Measures subscriber engagement |
| Watchlist Conversion | Measures conversion from saved content to viewing |
| Hit Concentration | Measures dependency on top-performing titles |
| Originals Share of Hours | Measures engagement generated by Originals |

The KPI definitions and calculations follow the project requirements.

---

# 5. Power BI Dashboard

The final analysis was presented through an interactive **Microsoft Power BI dashboard**.

## Dashboard Pages

### 1. Engagement Overview

- Monthly watch-hours trend
- Subscriber overview
- Completion rate
- Churn rate

### 2. Content Performance

- Watch hours by genre
- Top 10 titles by watch hours
- Completion rate by genre

### 3. Subscriber Insights

- Subscription plan distribution
- Subscriber segmentation
- Country analysis
- Subscriber trends

### 4. Customer Experience

- Device usage
- Rating distribution
- Review sentiment analysis

### 5. Catalogue & Investment

- Originals vs. Licensed content
- Watch hours by investment
- Watch hours per $1K of investment
- Licence expiry analysis

## 📊 Power BI Dashboard

### Dashboard Preview

<p align="center">
  <img src="reports/dashboard.png" alt="Power BI Dashboard" width="900">
</p>
