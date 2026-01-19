# 🔍 Glassdoor Workforce Analytics & Retention Engine
**Author:** Dinesh Kumaralingam

## 📌 Executive Summary
High employee turnover is a critical cost driver for modern enterprises. This project is an end-to-end analytics solution spanning cloud-based data collection, natural language processing, and predictive modeling designed to identify retention drivers and forecast workforce churn.

**Business Value:**
* **Risk Detection:** Identified that a "Neutral" or "Negative" business outlook nearly doubles the probability of employee churn, acting as a critical early warning signal[cite: 336, 384].
* **Strategic Planning:** Forecasted workforce stability using time-series modeling (Prophet), enabling data-driven hiring capacity planning[cite: 644].
* **Culture Audit:** Revealed a "Culture Gap" where large firms pay higher salaries but consistently lag behind smaller agile firms in culture and work-life balance ratings[cite: 221, 520].

## 🛠️ Technical Architecture
This project demonstrates a full-stack data science workflow:

### 1. Data Collection (Cloud & Engineering)
* **Infrastructure:** Deployed an Ubuntu VM on **Kakao Cloud** to execute long-running scraping tasks[cite: 77].
* **Scraping Pipeline:** Built a Python/Selenium scraper with anti-blocking measures (rotating User-Agents, randomized delays) to harvest **560,000+ reviews**[cite: 78, 79].
* **Data Engineering:** Parsed raw HTML/JSON snapshots into structured CSVs, handling skill arrays and date normalization.

### 2. Predictive Modeling (Machine Learning)
* **Churn Prediction:** Trained and evaluated Logistic Regression, XGBoost, and LightGBM models.
* **Result:** The **LightGBM** model achieved the highest performance with an **F1-Score of 0.3511** and **AUC of 0.638**, successfully identifying at-risk employees better than the baseline[cite: 383, 394].

### 3. Unsupervised Learning (NLP & Clustering)
* **Topic Modeling:** Applied **LDA (Latent Dirichlet Allocation)** to extract latent themes from thousands of "Pros/Cons" text reviews[cite: 575].
* **Segmentation:** Utilized **K-Means Clustering** (Silhouette Score: 0.47) to segment companies by cultural DNA, proving that "Perks" do not equal "Culture"[cite: 497, 794].

### 4. Forecasting (Time-Series)
* **Trend Analysis:** Deployed **Facebook Prophet** to model monthly churn rates, achieving a robust **Mean Absolute Error (MAE) of 0.0160**, outperforming ARIMA and VAR models[cite: 644, 784].

## 📊 Key Visualizations
*(See `images/` folder for full charts)*
* **Model Performance:** Comparative analysis showing LightGBM's dominance in F1/AUC metrics.
* **Retention Drivers:** Feature importance plots highlighting "Business Outlook" and "Overall Rating" as top predictors.
* **Cluster Radar:** Visualizing the trade-offs between Compensation and Culture across different firm sizes.

Note: A sample dataset (data/glassdoor_sample.csv) is provided for demonstration. The full dataset is excluded for privacy/size reasons.

## 📂 Repository Structure
```text
├── src/
│   ├── scraping/        # Python Selenium scripts for Kakao Cloud deployment
│   ├── modeling/        # R Markdown files for ML and Forecasting
│   └── data/            # Processed sample datasets (anonymized)
├── images/              # Plots and visualizations for documentation
├── setup.R              # One-click R environment setup
├── requirements.txt     # Python dependencies for scraping
└── README.md            # Project documentation
