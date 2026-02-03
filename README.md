# Clinical_Data_Analysis.md

Hello there, I am  Dr Sakina
I am a curious, innovative healthcare data analyst. I strive to set new standards and drive innovation in healthcare data analytics. This portfolio is the beginning of my journey to show who I am and to demonstrate my potential in reaching my goals. 

This folder contains projects that analyze various clinical data.
Every folder in this repository contains all relevant files, including code, pictures, and a raw dashboard link to Power BI.
The projects are explained in detail below, after this brief introduction.

Project 1. **Hospital Readmission Analysis**

Hospital readmissions within 30 days are a key quality metric, reflecting patient outcomes, care coordination, and chronic disease management. Diabetes patients are particularly at risk due to complex treatment regimens and comorbidities.

Project 2. **Risk Stratification for Patients with Chronic Diseases**
This project aims to identify patients at low, medium, or high risk of developing health complications based on demographics, lifestyle factors, and clinical indicators. By stratifying risk, healthcare teams can prioritize interventions, prevent adverse outcomes, and optimize care resources, which is essential in a value-based care environment.

Project 3. **Hospital Appointment No-Show Analysis**
This project analyzes a real-world hospital appointment dataset (110,514 records) to identify the **primary drivers of no-show behavior** and translate those insights into **actionable operational strategies**.

The goal is not only to understand *who* misses appointments, but *why* — and more importantly, **what the hospital can do about it**.

More Projects to come.... 

**Please get in touch in case you're unable to access any documents.** 
**email @ sakina.khanrashid@outlook.com**

**Project 1** .  **Diabetes 30-Day Readmission Analysis**

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

> “The card shows that 23.6% of patients have very high glucose, while the column chart shows that these patients have a 55.5% 30-day readmission rate. This distinction between patient distribution vs outcome rate is critical in hospital dashboards.”
> 

> Same applies for Poor Control A1C — 48.3% of measured patients are Poor Control, and their readmission rate is ~45.2% in the chart.
>


