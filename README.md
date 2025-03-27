# 📊 Advanced Databases Project (Social Media Dashboard)

A comprehensive project showcasing advanced **SQL + MongoDB** operations for a social media platform. This dual-stack implementation demonstrates practical applications of database design, aggregation, stored procedures, triggers, and visualization dashboards.

---

## 🔧 Technologies Used

- **MySQL 8+** (Relational DB)
- **MongoDB 6+** (NoSQL Document DB)
- **Python 3.10+**
- **Plotly / Dash** for data visualization

---

## 📁 Project Structure

```bash
AdvancedDatabaseProject/
│
├── analytics/                # Python dashboards & visualization scripts
│   └── plot_post_count.py
│
├── mongodb/                  # MongoDB CRUD and aggregation
│   ├── initialize-db.mongodb.js
│   ├── find-query.mongodb.js
│   ├── update.mongodb.js
│   ├── delete.mongodb.js
│   ├── aggregation.mongodb.js
│   └── delete_queries.py
│
├── sql/                      # Full MySQL project
│   ├── create.sql
│   ├── insert.sql
│   ├── seed_data.sql
│   ├── create_procedures.sql
│   ├── create_triggar.sql
│   ├── basic-crud.sql
│   ├── join-queries.sql
│   ├── procedure.sql
│   ├── analytics.sql
│   ├── aggregation-queries.sql
│   ├── activity_log.sql
│   └── trigger_queries.sql
│
├── .env                      # Local DB credentials
└── connect.js                # DB connection helper (Node/Mongo optional)
