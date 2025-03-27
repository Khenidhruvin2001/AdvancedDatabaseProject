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


## ✅ MySQL Implementation

### 🔥 Features

- **Relational schema** for a social media app:
  - Tables: `user`, `post`, `post_likes`, `post_tags`, `follow`, `notification`, etc.
- **Stored Procedures**:
  - Add post, update activity log, trigger notifications
- **Triggers**:
  - Auto-update `last_activity`, prevent deletion of users with posts
- **Analytics**:
  - Most liked posts
  - Most active users
  - Most followed users
  - Most tagged posts

---

### 📌 Sample SQL Queries

```sql
-- Top 5 users by post count
SELECT u.name, COUNT(p.id) AS total_posts
FROM user u
JOIN post p ON u.id = p.user_id
GROUP BY u.name
ORDER BY total_posts DESC
LIMIT 5;

-- Most liked posts
SELECT p.id, COUNT(pl.user_id) AS like_count
FROM post p
JOIN post_likes pl ON p.id = pl.post_id
GROUP BY p.id
ORDER BY like_count DESC;
