# 🔍 Customer Behaviour Analysis

> Big Data Analytics Project | BITE411L | VIT Vellore | Winter 2025-26

**Submitted by:**
- Sai Krishna Teja — 23BIT0034
- Dheerath — 23BIT0167

**Guide:** Dr. Mohana Priya, Associate Professor, SCORE, VIT Vellore

---

## 📌 Project Overview

This project analyzes **1 million synthetic customer transaction records** using the Hadoop ecosystem to uncover patterns in customer behaviour, detect fraud, and visualize insights on a live dashboard.

### Key Highlights
- 🏦 1,000,000 records analyzed
- 💰 Total Amount Spent: ₹25,08,01,18,953
- 💳 Total Customer Balance: ₹50,95,50,80,280
- 🚨 Identified Fraud Cases: 1,21,076

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Java** | Synthetic data generation |
| **Hadoop HDFS** | Distributed storage |
| **Apache Hive** | SQL-like querying (HiveQL) |
| **YARN** | Resource management |
| **Apache Superset** | Dashboard & visualization |
| **Ubuntu (VirtualBox)** | Runtime environment |

---

## 🏗️ System Architecture

```
Java (Generate Data)
        ↓
customers_1M.csv
        ↓
Hadoop HDFS (/customer_data/)
        ↓
Apache Hive (HiveQL Queries)
        ↓
Apache Superset (Dashboard)
```

---

## 📂 Project Structure

```
customer-behaviour-analysis/
│
├── src/
│   └── CustomerDataGenerator.java   # Generates 1M customer records
│
├── hive/
│   └── queries.hql                  # All HiveQL analysis queries
│
├── screenshots/                     # Dashboard & terminal screenshots
│   ├── dashboard.png
│   ├── hdfs_status.png
│   ├── hive_results.png
│   └── superset_charts.png
│
├── .gitignore
└── README.md
```

---

## ⚙️ Setup & Run Instructions

### Prerequisites
- Ubuntu 22.04 LTS (VirtualBox)
- Java JDK 21+
- Hadoop 3.3.6
- Apache Hive 3.1.3
- Apache Superset

---

### Step 1: Generate Data

```bash
# Compile
javac CustomerDataGenerator.java

# Run (generates customers_1M.csv)
java CustomerDataGenerator
```

---

### Step 2: Start Hadoop Services

```bash
start-yarn.sh
start-dfs.sh

# Verify all services are running
jps
# Expected: NameNode, DataNode, SecondaryNameNode, ResourceManager, NodeManager
```

---

### Step 3: Upload to HDFS

```bash
# Create directory
hdfs dfs -mkdir /customer_data

# Upload CSV
hdfs dfs -put customers_1M.csv /customer_data/

# Verify
hdfs dfs -ls /customer_data
```

---

### Step 4: Run Hive Queries

```bash
# Start Hive
hive

# Run all queries
hive -f hive/queries.hql
```

---

## 📊 Analysis Results

### State-wise Transactions
| State | Transactions |
|-------|-------------|
| GJ | 1,25,450 |
| DL | 1,25,133 |
| WB | 1,25,093 |
| KA | 1,25,093 |
| TN | 1,25,012 |

### Age Group Behaviour
| Group | Transactions | Avg Spending |
|-------|-------------|--------------|
| Senior (45+) | 5,32,984 | ₹25,095 |
| Middle (25-45) | 3,50,412 | ₹25,100 |
| Young (<25) | 1,16,604 | ₹25,052 |

### Device Usage
| Device | Count |
|--------|-------|
| Laptop | 2,50,832 |
| Tablet | 2,49,879 |
| Mobile | 2,49,691 |
| ATM | 2,49,598 |

### City-wise Fraud Cases
| City | Fraud Count |
|------|------------|
| Mumbai | 15,214 |
| Bangalore | 15,156 |
| Hyderabad | 15,092 |
| Chennai | 15,079 |
| Delhi | 15,050 |

---

## 🚀 Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit: Customer Behaviour Analysis - BITE411L"
git branch -M main
git remote add origin https://github.com/your-username/customer-behaviour-analysis.git
git push -u origin main
```

---

## 📄 License

This project was developed for academic purposes at VIT Vellore.
