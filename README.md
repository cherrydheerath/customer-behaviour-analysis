# 🔍 Customer Behaviour Analysis
> Big Data Analytics Project | BITE411L | VIT Vellore | Winter 2025-26

**Submitted by:**
- Dheerath — 23BIT0167
- Sai Krishna Teja — 23BIT0034

**Guide:** Dr. Mohana Priya, Associate Professor, SCORE, VIT Vellore

## 📌 Overview
Analyzed 1,000,000 synthetic customer transaction records using Hadoop ecosystem to uncover behaviour patterns and detect fraud.

| Metric | Value |
|--------|-------|
| Total Records | 1,000,000 |
| Total Amount Spent | ₹25,08,01,18,953 |
| Total Customer Balance | ₹50,95,50,80,280 |
| Fraud Cases Detected | 1,21,076 |

## 🛠️ Tech Stack
| Tool | Purpose |
|------|---------|
| Java | Data generation |
| Hadoop HDFS | Distributed storage |
| Apache Hive | SQL querying |
| Apache Superset | Dashboard & visualization |
| Ubuntu VirtualBox | Runtime environment |

## 📂 Files
- `CustomerDataGenerator.java` — Generates 1M records
- `queries.hql` — All HiveQL analysis queries
- `.gitignore` — Excludes large/unnecessary files

## ⚙️ How to Run
```bash
# 1. Generate data
javac CustomerDataGenerator.java
java CustomerDataGenerator

# 2. Start Hadoop
start-yarn.sh && start-dfs.sh

# 3. Upload to HDFS
hdfs dfs -mkdir /customer_data
hdfs dfs -put customers_1M.csv /customer_data/

# 4. Run Hive queries
hive -f queries.hql
```

## 📊 Key Results
- GJ state had highest transactions (1,25,450)
- Mumbai had most fraud cases (15,214)
- Senior age group (45+) had highest transactions (5,32,984)
- Laptop was most used device (2,50,832)
