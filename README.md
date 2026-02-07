# Clinical_Data_Analysis.md

## Hello there, I am  Dr Sakina
### I am a curious, innovative healthcare data analyst. I strive to set new standards and drive innovation in healthcare data analytics. This portfolio is the beginning of my journey to show who I am and to demonstrate my potential in reaching my goals. 

##### This folder contains projects that analyze various clinical data.
##### Every folder in this repository contains all relevant files, including code, pictures, and a raw dashboard link to Power BI.
##### The projects are explained in detail below, after this brief introduction.

**Project 1.** **Hospital Readmission Analysis**

Hospital readmissions within 30 days are a key quality metric, reflecting patient outcomes, care coordination, and chronic disease management. Diabetes patients are particularly at risk due to complex treatment regimens and comorbidities.

**Project 2.** **Risk Stratification for Patients with Chronic Diseases** 
This project aims to identify patients at low, medium, or high risk of developing health complications based on demographics, lifestyle factors, and clinical indicators. By stratifying risk, healthcare teams can prioritize interventions, prevent adverse outcomes, and optimize care resources, which is essential in a value-based care environment.

**Part 2 of project 2 - Predictive Analysis**


**Project 3.** **Hospital Appointment No-Show Analysis**
This project analyzes a real-world hospital appointment dataset (110,514 records) to identify the **primary drivers of no-show behavior** and translate those insights into **actionable operational strategies**.

The goal is not only to understand *who* misses appointments, but *why* — and more importantly, **what the hospital can do about it**.

# NLP Project - Biomedical AI Sentiment Analysis
This project focuses on building a sentiment analysis pipeline for biomedical and healthcare-related AI text. The goal is to automatically classify sentences into positive, neutral, or negative sentiments.

More Projects to come.... 

**Please get in touch in case you're unable to access any documents.** 
**email @ sakina.khanrashid@outlook.com**

# All projects in details below : 

# NLP 
## Biomedical AI Sentiment Analysis
#### Project Overview

This project focuses on building a sentiment analysis pipeline for biomedical and healthcare-related AI text. The goal is to automatically classify sentences into positive, neutral, or negative sentiments.

With the growing use of AI in healthcare, understanding the sentiment in research and discussions helps identify optimism, concerns, or neutral findings in biomedical literature. This project demonstrates an end-to-end NLP workflow, from data exploration and preprocessing to model training, evaluation, and deployment.

**Dataset**

Source: HuggingFace – Shekswess/ai-healthcare-biomedical-sentiment

Content: 100 short biomedical AI-related text prompts

Columns: keyword, topic, language, prompt, label

Sentiment Classes: positive, neutral, negative

**Observations:**

Dataset is small but balanced: 36 positive, 33 negative, 31 neutral

Average text length ~25 words

Well-suited for TF-IDF based traditional ML models

###### Workflow & Decision-Making

✅ Dataset loaded + explored

✅ Cleaned text pipeline

✅ TF-IDF feature engineering

✅ Two trained models (LogReg + SVM)

✅ Evaluation with classification report + confusion matrix

✅ Model comparison table

✅ Saved + loaded model (deployment-ready)

✅ Custom prediction function


**1. Data Exploration**

Inspected columns and sample text

Checked label distribution to ensure balance

Analyzed text length to decide on preprocessing and max sequence considerations

Decision Reasoning:
Balanced datasets reduce bias; understanding text length informs preprocessing choices for feature extraction.

**2. Data Cleaning**

Converted text to lowercase

Removed punctuation and extra spaces

Created a clean_prompt column

Decision Reasoning:

Cleaning ensures consistent tokens for TF-IDF vectorization

Minimizes noise and improves model performance

**3. Feature Engineering**

Used TF-IDF vectorization:

max_features=2000 (top words/bigrams)

ngram_range=(1,2) (unigrams + bigrams)

stop_words="english"

Decision Reasoning:

Captures meaningful words and phrases

Reduces influence of common stopwords

Balances model complexity with performance

**4. Label Encoding**

Converted sentiment labels into numeric values:

negative → 0

neutral → 1

positive → 2

Decision Reasoning:

Required for ML models which only understand numbers

**5. Train/Test Split**

Split 80/20 with stratification

Maintained balanced distribution in both sets

Decision Reasoning:

Ensures fair evaluation on unseen data

Prevents test set from being biased

**6. Model Training**

Baseline Model: Logistic Regression

Alternative Model: Linear SVM (LinearSVC)

Decision Reasoning:

Logistic Regression: interpretable, fast, strong baseline

SVM: robust in high-dimensional text space (TF-IDF features)

Comparing models ensures optimal performance and justifies model choice

**7. Evaluation**

Metrics used:

Accuracy: overall correctness (good due to balanced dataset)

Precision / Recall / F1-Score: class-wise performance

Confusion Matrix: visualizes errors per class

**Decision Reasoning:**

Accuracy alone can be misleading; F1-score balances precision and recall

Class-level analysis identifies strengths and weaknesses (e.g., neutral class recall lower than others)

**8. Model Saving & Deployment**

Saved Logistic Regression model and TF-IDF vectorizer with joblib

Created a reusable prediction function

**Decision Reasoning:**

Demonstrates real-world deployment readiness

Makes workflow reproducible without retraining

**Results**

Both Logistic Regression and SVM achieved 90% accuracy

Positive and negative sentiments were predicted almost perfectly

Neutral sentiment had a slightly lower recall (0.67), highlighting challenges in ambiguous or mixed sentiment text

**Insight:**

The models perform well on small, clean datasets. Highlighting neutral misclassification shows critical thinking about real-world model limitations.

Sample Predictions
Text	Predicted Sentiment
AI is improving patient outcomes in hospitals.	positive
The use of AI raises serious ethical concerns about privacy.	negative
AI is being explored in healthcare but results are still unclear.	negative

### Future Improvements

Increase dataset size to improve model generalization

Try deep learning approaches (e.g., BERT) for improved contextual understanding

Hyperparameter tuning to optimize model performance

Better neutral detection using data augmentation or class weighting

Deployment: integrate with web app (Flask/Streamlit) for live demo


**Key Takeaways**

An end-to-end NLP project can be done even with small datasets

Proper EDA, preprocessing, and evaluation are critical for robust models

Comparing multiple models justifies decisions and strengthens portfolio credibility

Saving models and creating prediction functions demonstrates deployment readiness

**Highlight:**
This project not only demonstrates technical skills (Python, NLP, ML) but also decision-making reasoning, showing why each step was taken, and how to evaluate and improve models responsibly.

# **Project 1** .  **Diabetes 30-Day Readmission Analysis**
                                                                                    

Glucose risk stratification revealed that patients with very high glucose levels had the highest 30-day readmission rate (55.5%), while patients with normal glucose had the lowest (45.4%). Patients without glucose measurements also had elevated readmission (46.0%), highlighting potential care gaps. This visual complements A1C analysis and demonstrates the dashboard’s ability to combine clinical lab indicators with outcomes for actionable insights.

Hospital readmissions within 30 days are a key quality metric, reflecting patient outcomes, care coordination, and chronic disease management. Diabetes patients are particularly at risk due to complex treatment regimens and comorbidities.

This project analyzes **101,766 hospital encounters** using the **UCI/Kaggle diabetes readmission dataset**, focusing on:

- Predicting 30-day readmissions
- Understanding patient risk patterns based on **demographics, prior hospital utilization, and clinical indicators** (A1C & glucose)

The goal was to build a **Power BI dashboard** that tells a clear, evidence-based story for hospital quality improvement.

---

**2. Project Objective**

- **Primary Outcome:** 30-day readmission (binary)
- **Secondary Goals:**
    - Identify utilization patterns (inpatient, outpatient, emergency visits)
    - Examine clinical risk (A1C & glucose control)
    - Provide actionable insights for hospital stakeholders

---

## **3. Dataset Overview**

| Feature Category | Columns | Notes |
| --- | --- | --- |
| Demographics | Age, Gender, Race | Encounter-level |
| Utilization | Prior inpatient, outpatient, emergency visits | Historical patterns |
| Clinical Risk | A1C risk, Glucose risk | Lab-based indicators |
| Outcome | `readmitted_binary` | Target (0 = no, 1 = readmitted) |
- **Rows:** 101,766 encounters
- **Columns:** 24
- **No missing values**
- **Binary fields and numeric KPIs** ready for dashboard

---

## **4. Dashboard Storyline & Findings**

### **A. Demographics & Age**

**Visual:** Bar chart – Readmission rate by age group

**Insight:**

- Readmission increases with age, with the highest rates among 80–100 years.
- Highlights the vulnerability of older patients and the need for tailored discharge planning.

---

### **B. Hospital Utilization**

**Visuals:** Clustered column charts – Prior inpatient, emergency, and outpatient visits vs readmission

**KPIs:**

- Avg prior inpatient visits: 0.64
- Avg prior emergency visits: 0.21
- Avg prior outpatient visits: 0.37

**Insights:**

- Inpatient & emergency visits show a clear dose–response relationship with readmission risk
- Outpatient visits are relatively flat (1–4), suggesting outpatient frequency alone is **not strongly predictive**

> Hospitals can use these patterns to flag high-risk patients based on historical utilization.
> 

---

### **C. Clinical Risk: A1C Control**

**Visual:** Column chart – Readmission rate by A1C risk

**Values:**

- Normal: 41.7%
- Elevated: 44.2%
- Poor Control: 45.2%
- Not Measured: 46.5%

**Insight:**

- Poor or unmeasured A1C is associated with higher readmission
- Demonstrates the importance of lab monitoring for quality care

---

### **D. Clinical Risk: Glucose Control**

**Visual:** Column chart – Readmission rate by Glucose risk

**Values:**

- Normal: 45.4%
- High: 48.1%
- Very High: 55.5%
- Not Measured: 46.0%

**Insight:**

- Very high glucose is the strongest risk factor
- Unmeasured glucose also signals care gaps
- Together with A1C, this completes the clinical severity picture

---

### **E. Executive KPIs**

**Cards at the top of the dashboard:**

| KPI | Value |
| --- | --- |
| 30-Day Readmission Rate | 46% |
| Avg Prior Inpatient Visits | 0.64 |
| Avg Prior Emergency Visits | 0.21 |
| Avg Prior Outpatient Visits | 0.37 |
| % Poor A1C Control | 45.2% |
| % Very High Glucose | 55.5% |

**Insight:**

- Quick-glance summary for hospital executives
- Highlights both **historical utilization** and **clinical risk**

---

## **5. Key Takeaways**

1. **Severity Stratification:**
    - Historical inpatient & emergency visits are strong predictors of readmission
2. **Clinical Risk Monitoring:**
    - Poor or unmeasured A1C and very high glucose levels are associated with higher readmission
3. **Actionable Insights:**
    - Hospitals can use this dashboard to:
        - Identify high-risk patients
        - Target follow-up care and discharge planning
        - Monitor lab testing compliance
4. **Portfolio & Learning Value:**
    - Cleaned, visualized, and analyzed 100K+ hospital encounters
    - Built KPI-driven, clinically interpretable dashboards
    - Developed data storytelling skills for healthcare analytics

## **Why the numbers look different**

1. **Poor Control = 48.3%** → this is plausible. It’s calculated **as % of measured A1C**, which is what we want. ✅
2. **Very High Glucose = 23.6%** → much lower than the 55.5% from your chart.

### **Reason**

- In the chart (column chart), we plotted **readmission rate** by `glu_risk`:
    
    ```
    Very High →ReadmissionRate= Average(readmitted_binaryfor Very High)
    
    ```
    
- That **55.5%** is **readmission rate**, not % of patients in that category.
- Your card **% Very High Glucose** is:

```
% Very High Glucose =
COUNTROWS(Very High Glucose) / COUNTROWS(all measured glucose)

```

- This shows **how many patients are Very High**, not their readmission rate.

✅ So the difference is **not a mistake** — these two KPIs measure **different things**:

| Visual / Card | What it shows |
| --- | --- |
| Column Chart (55.5%) | Readmission rate among patients with Very High glucose |
| Card (23.6%) | Fraction of all measured patients who are Very High glucose |

---

> The card shows that 23.6% of patients have very high glucose, while the column chart shows that these patients have a 55.5% 30-day readmission rate. This distinction between patient distribution vs outcome rate is critical in hospital dashboards.
> Same applies for Poor Control A1C — 48.3% of measured patients are Poor Control, and their readmission rate is ~45.2% in the chart.

# **Project 2. Patient Risk Stratification Dashboard**

## **Introduction**

Healthcare organizations often need to quickly identify patients at risk of chronic conditions such as hypertension, obesity, smoking-related complications, or physical inactivity. This project demonstrates a full **data analytics pipeline**, from raw data cleaning and transformation in Python, to database management in SQL, and finally to interactive visualization in Power BI. The end goal is a **Patient Risk Stratification Dashboard** that provides actionable insights for clinicians, administrators, and stakeholders to make informed decisions on preventive care.

This project highlights **data engineering, feature engineering, ETL, SQL querying, and dashboarding skills**, showing the ability to handle real-world healthcare datasets and extract meaningful insights.

---

## **Step 1: Data Cleaning & ETL in Python**

We began with multiple raw datasets from NHANES-like sources:

- **`demo_clean`**: patient demographics (age, gender, race/ethnicity, income)
- **`bmx_clean`**: BMI measurements
- **`bpx_clean`**: blood pressure readings
- **`smq_clean`**: smoking status
- **`paq_clean`**: physical activity

**Tasks performed in Python:**

1. **Cleaning and Type Conversion**
    - Converted patient IDs to integers for consistent joins.
    - Handled missing or invalid values (NaN replacement, NHANES codebook corrections).
2. **Feature Engineering**
    - **Obesity flag**: BMI ≥ 30 → 1, otherwise 0
    - **Hypertensive flag**: systolic ≥130 or diastolic ≥80 → 1, else 0
    - **Smoker flag**: current and ever smoked → 1, else 0
    - **Physically inactive flag**: from questionnaire data
3. **Risk Scoring**
    - Combined the four risk flags into a `risk_score` (sum).
    - Categorized `risk_category`: 0 → Low, 1–2 → Medium, 3–4 → High
4. **Final Master Table**
    - Merged all cleaned datasets on `patient_id`
    - Resulting CSV: **`master_risk_table.csv`**, ready for database loading

> This step demonstrated **ETL processes, data cleaning, transformation, and feature engineering**, core skills in Python and pandas.
> 

---

## **Step 2: SQL for Validation & Aggregation**

Once the master table was exported to SQL, we used **SQL queries** to validate and aggregate the data:

- **Validation queries**:
    - Total patients: 11,933
    - Key flags: Obese: 2,699 | Hypertensive: 2,504 | Smoker: 606 | Inactive: 1,168
    - Risk category counts: Low: 6,880 | Medium: 4,837 | High: 216
- **Analytical queries**:
    - Average risk by age groups (Young child, Child, Middle age, Senior)
    - Multiple risk factor distribution (0–4 risk factors)
    - Hypertension prevalence by group
- **SQL Views** were created for easier integration into Power BI, e.g.:

```sql
CREATE VIEW risk_summary AS
SELECT
    risk_category,
    COUNT(*) AS patient_count,
    AVG(risk_score) AS avg_risk_score
FROM patient_risk_master
GROUP BY risk_category;

```

> This step demonstrates **data validation, aggregation, and view creation**, making complex analyses accessible and reusable.
> 

---

## **Step 3: Power BI Dashboard Creation**

The goal of the dashboard is to provide **quick, actionable insights** for clinicians:

**Step 3a: Loading Data**

- Connected Power BI to the SQL database (or CSV if SQL was unavailable).
- Ensured proper **data types** (numeric for risk_score, categorical for risk_category, flags as integers).

**Step 3b: Dashboard Layout**

1. **KPI Cards**
    - Key metrics: Obese, Hypertensive, Smoker, Physically inactive
    - Conditional formatting (color-coded for high, medium, low prevalence)
2. **Column/Bar Charts**
    - Average risk by age group
    - Average risk by income group
    - Risk category distribution
3. **Slicers**
    - Age group
    - Income ratio
    - Gender / Race/ethnicity
4. **Tooltips & Insights**
    - Hovering over bars shows prevalence of hypertension, obesity, smoking
    - Explains why middle age or low-income groups have higher risk
5. **Advanced Visualization**
    - Highlight trends and correlations (risk vs age, income, lifestyle)
    - Clear labels, intuitive color coding, clean layout

> This step demonstrates **data storytelling, visualization best practices, and dashboard design** to make the insights actionable.

---

## **Step 4: Insights & Value**

**Key insights from the dashboard**:

- Middle-aged patients have the highest average risk score, largely driven by hypertension and obesity.
- Socioeconomic factors matter: lower income groups show higher prevalence of key risk factors.
- Majority of patients fall into the Low risk category, but a significant subset has multiple risk factors.
- Clinicians can quickly identify high-risk patients for targeted interventions.

**Why this is valuable**:

- Stakeholders (clinicians, administrators, policymakers) can prioritize resources efficiently.
- Dashboards allow **real-time monitoring** of risk factor prevalence and trends.
- Data-driven preventive measures can be implemented for high-risk groups.

---

## **Step 5: Conclusion**

In this project, we demonstrated the **full analytics lifecycle**:

1. **Python**: Cleaned raw data, engineered meaningful features, created a master risk table.
2. **SQL**: Validated the data, aggregated key metrics, created views for easy reporting.
3. **Power BI**: Built an interactive, visually appealing dashboard that tells a story and highlights actionable insights.

The **end-to-end pipeline** shows that analytics is not just about coding—it’s about **transforming raw data into insights** that can guide real-world decisions. By integrating Python, SQL, and Power BI, we have built a **reproducible and scalable solution** for patient risk stratification.

---

This project demonstrates expertise in:

- **ETL & Feature Engineering** (Python & pandas)
- **Data Validation & Aggregation** (SQL queries, views)
- **Visualization & Storytelling** (Power BI)
- **Analytical Thinking & Interpretation** (risk analysis, trends, correlations)

# Part 2 /Project 2 Predictive analysis - Predicting High-Risk Patients

**Predicting High-Risk Patients Using Machine Learning**
**Business Problem / Objective**

Healthcare providers need to proactively identify patients at high risk of adverse outcomes based on demographics, lifestyle, and health factors. Early identification allows for targeted interventions, better resource allocation, and improved patient outcomes.

Goal: Build a predictive model to classify patients as high-risk or not, and understand the key factors contributing to high risk.

**Data Overview**

Dataset: master_table (~12k patients)

Features: Age, gender, race/ethnicity, income ratio, obesity, hypertension, smoking status, physical inactivity

Target: high_risk (1 = high risk, 0 = low/medium risk)

Challenge: Severe class imbalance (~2% high-risk patients)

Observation: Most patients are low or medium risk; high-risk patients are rare but critical to identify.

**Approach / Methodology**

Step 1: Data Exploration (EDA)

Examined distributions of age, lifestyle factors, and health indicators.

Visualized relationships between features and risk categories.

Step 2: Data Preparation

Created a binary target variable (high_risk).

Selected relevant features and removed any target-leakage columns (e.g., risk_score).

Split data into train/test sets, ensuring stratification to maintain class proportions.

Step 3: Address Class Imbalance

Applied SMOTE oversampling to generate synthetic high-risk cases.

Alternatively, experimented with class_weight='balanced' for models.

Step 4: Model Building

Logistic Regression: Interpretable, focused on catching all high-risk patients.

Random Forest: Flexible, captured non-linear relationships, prioritized precision.

Step 5: Model Evaluation

Metrics used: Recall, Precision, F1-score, ROC-AUC

Focused on recall for high-risk patients as clinically most important.

**Key Findings**

Logistic Regression:

Recall = 1.0 for high-risk patients → no high-risk patients missed

Precision = 0.15 → many false positives

Highly interpretable; good for prioritizing safety.

Random Forest:

Precision = 1.0 for high-risk → predictions are highly reliable

Recall = 0.81 → some high-risk patients missed

Provided feature importance, highlighting key drivers of risk.

Top Predictive Features: Age, hypertension, obesity, smoking status, physical inactivity

Interpretation:

Logistic Regression is suitable when avoiding missed high-risk cases is critical.

Random Forest is suitable when high-confidence predictions are needed with fewer false positives.

**Recommendations / Impact**

Implement early-warning systems using predictive models to identify high-risk patients.

Use Logistic Regression for broad screening (catch everyone at risk).

Use Random Forest for targeted interventions where resources are limited.

Focus interventions on modifiable risk factors (obesity, hypertension, smoking, inactivity).

Next Steps:

Incorporate additional features (lab results, medication history) to improve accuracy.

Evaluate models in real clinical settings and monitor outcomes.

# **Project 3. Hospital Appointment No-Show Analysis**

**Improving Operational Efficiency Through Data-Driven Scheduling**

---

## 1. Introduction

Missed medical appointments (“no-shows”) represent a critical operational challenge for healthcare systems. They waste clinical capacity, increase waiting times for other patients, and reduce the overall quality of care delivery.

This project analyzes a real-world hospital appointment dataset (110,514 records) to identify the **primary drivers of no-show behavior** and translate those insights into **actionable operational strategies**.

The goal is not only to understand *who* misses appointments, but *why* — and more importantly, **what the hospital can do about it**.

---

## 2. Data Source & Initial Preparation

### Dataset Overview

- Source: Public Kaggle dataset (Hospital Appointment No-Shows)
- Records: **110,514 appointments**
- No missing values
- Data stored in **SQLite**, extracted into CSV for analysis

### Key Variables

- Appointment & scheduling: `scheduled_date`, `appointment_date`, `waiting_days`
- Demographics: `age`, `gender`, `neighbourhood.`
- Medical conditions: `hypertension`, `diabetes`, `alcoholism`, `handicap.`
- Engagement: `sms_received`
- Outcome: `no_show`

---

## 3. Data Readiness & Modeling Decisions

Before importing into Power BI, several **analytical design decisions** were made to ensure clarity and performance.

### 3.1 Feature Engineering (Calculated Columns)

Instead of analyzing raw values directly, I created **semantic groupings** to make patterns interpretable:

- **Age Group**
    
    Bucketed age into ranges (0–10, 11–20, …, 81+) to observe behavioral trends across life stages.
    
- **Waiting Days Group**
    
    Grouped `waiting_days` into:
    
    - Same Day
    - 1–3 days
    - 4–7 days
    - 8–14 days
    - 15–30 days
    - 30+ days
    
    This allowed the analysis to focus on *time thresholds* rather than individual day values.
    
- **Number of Comorbidities**
    
    Summed binary medical indicators (hypertension, diabetes, alcoholism, handicap) to quantify overall medical complexity.
    
- **Comorbidity Group**
    
    Simplified into:
    
    - No comorbidity
    - 1 comorbidity
    - 2+ comorbidities
    
    This made comparisons intuitive for non-technical stakeholders.
    

### 3.2 Measures vs Columns (Modeling Choice)

- **Columns** were used for grouping and slicing (Age Group, Waiting Days Group).
- **Measures** were used for KPIs and aggregation:
    - % No-Show
    - Average Waiting Days
    - Total Appointments
    - Same-Day Attendance %

This separation ensured the model remained **scalable, flexible, and performant**.

---

## 4. Power BI Dashboard Design Philosophy

Rather than building a single overcrowded page, the report was structured into **three focused pages**, each answering a distinct business question:

1. **Operational Efficiency** – *What is the main driver of no-shows?*
2. **Geographic Risk** – *Where are failures concentrated?*
3. **Patient Demographics** – *Who is most and least reliable?*

This mirrors how real healthcare decisions are made: **overview → diagnosis → intervention**.

---

## 5. Key Findings & Storyline

---

## Page 1: Operational Efficiency

### *“Time is the enemy of attendance.”*

This dashboard establishes the **single most important insight** of the project.

### Core Findings

- **Same-Day Appointments = Gold Standard**
    - Attendance rate: **~95%**
    - Lowest no-show risk across all patient groups
- **The Slope of Disengagement**
    - No-show rate increases steadily with waiting time
    - Patients waiting **30+ days** miss appointments at a rate of **~35%**
- **The Waiting Gap**
    - Average wait for patients who *show up*: **~9 days**
    - Average wait for *no-shows*: **~15 days**

### Interpretation

This proves that **waiting time is the strongest predictor of patient behavior**, more influential than age, gender, or health status.

> The problem is not patient irresponsibility — it is scheduling friction.
> 

---

## Page 2: Geographic Risk

### *“Localized anomalies and logistical barriers.”*

This page investigates **where** the system fails.

### Core Findings

- **High-Volume Stability**
    - Large neighborhoods (e.g., Jardim Camburi) manage high appointment volumes with stable no-show rates (~19–20%).
- **Major Outlier**
    - **ILHAS OCEANICAS DE TRINDADE** shows a **near 100% no-show rate**.
    - This is a critical red flag indicating:
        - severe transport/logistical barriers **or**
        - potential data quality issues
- **Scatter Plot Insight**
    - Most neighborhoods follow the expected trend:
        - Longer wait → higher no-shows
    - However, some neighborhoods show **high no-show rates even with short waits**, suggesting **non-time-related barriers** (transport, socioeconomic factors).

---

## Page 3: Patient Demographics

### *“Reliability increases with age and health necessity.”*

This page explains **who** is most likely to attend.

### Core Findings

- **The Reliability Curve (U-Shaped)**
    - Most reliable:
        - Children (0–10)
        - Seniors (60+)
    - Least reliable:
        - **Young adults (15–30)**
- **Comorbidity Paradox**
    - Patients with **hypertension, diabetes, or alcoholism** show **better attendance** than patients with no conditions.

### Interpretation

Patients with chronic conditions perceive appointments as **essential**, while healthier patients treat them as **optional**, especially when waiting times are long.

---

## 6.  Summary 

> *“Our biggest issue isn’t the patients — it’s the calendar.Same-day appointments achieve a 95% attendance rate, but when patients wait over 30 days, we lose 35% of them.Young adults and specific neighborhoods are the most at risk. By reducing wait times and targeting these groups, attendance can improve dramatically.”*
> 

---

## 7. Recommendations & Action Plan

### 1. Wait Time Strategy

- **Finding:** No-shows increase from **5% (Same-Day)** to **35% (30+ Days)**
- **Action:**
    - Implement a **Fast-Track scheduling rule**
    - If an appointment exceeds **10 days**, trigger high-touch confirmation (phone call, not just SMS)
- **KPI to Monitor:**
    - *% of appointments scheduled within 7 days*

---

### 2. Demographic Targeting

- **Finding:** Highest no-show rates in the **15–30 age group**
- **Action:**
    - Use **stronger digital engagement** (WhatsApp, push notifications)
    - Emphasize appointment importance in messaging
- **KPI to Monitor:**
    - *No-Show Rate for patients under 30*

---

### 3️. Geographic & Logistical Fixes

- **Finding:** Near-total failure in **Ilhas Oceanicas**
- **Action:**
    - Investigate transport or facility access
    - Consider **telehealth or mobile clinics**
- **KPI to Monitor:**
    - *Regional No-Show Variance*

---

##  Conclusion

This project demonstrates how **data modeling, thoughtful visualization, and focused storytelling** can transform raw appointment data into **operational insight**.

The analysis shows that:

- No-shows are **system-driven**, not patient-driven
- Waiting time is the dominant lever
- Targeted interventions — not blanket policies — yield the greatest impact

By aligning scheduling strategy with patient behavior, healthcare providers can improve attendance, reduce wasted capacity, and deliver better care.



