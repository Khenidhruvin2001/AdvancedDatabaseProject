
# 📊 Advanced Database Project – Social Media Dashboard

A hybrid database project using **MySQL** and **MongoDB** to simulate a **social media platform** with features like posts, likes, follows, tags, notifications, and advanced analytics. This project highlights advanced database concepts including stored procedures, triggers, and data visualizations.

---

## 📁 Project Structure

```
AdvancedDatabaseProject/
│
├── analytics/                # Python visualization scripts (Plotly)
│   └── plot_post_count.py
│
├── mongodb/                  # MongoDB CRUD and aggregation logic
│   ├── initialize-db.mongodb.js
│   ├── find-query.mongodb.js
│   ├── update.mongodb.js
│   ├── delete.mongodb.js
│   ├── aggregation.mongodb.js
│   └── delete_queries.py
│
├── sql/                      # Full MySQL-based schema and logic
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
├── .env                      # Local DB credentials (ignored)
└── connect.js                # (Optional) JS connector for Mongo/MySQL
```

---

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
```

---

## 🍃 MongoDB Implementation

### 🔥 Features

- **CRUD operations** for:
  - Stories (post-like documents)
  - Authors (user-like documents)
  - Likes (embedded/linked)
- **Aggregation Pipelines** for:
  - Tag frequency
  - Yearly trends
  - Popular content insights

---

### 📌 Sample Aggregation Query

```javascript
db.stories.aggregate([
  { $unwind: "$tags" },
  { $group: { _id: "$tags", count: { $sum: 1 } } },
  { $sort: { count: -1 } }
])
```

---

## 📈 Visual Dashboard

> Built using **Python** + **Plotly Express**

### Visualizations:
- Posts per User (Bar Chart)
- Likes per Post (Bar Chart)
- Follower Leaderboard (Horizontal Chart)
- Tag Frequency (Pie/Bar Chart)
- MongoDB vs MySQL Analysis

---

## ⚙️ How to Run

### Prerequisites:
- MySQL 8+
- MongoDB 6+
- Python 3.10+
- VSCode (recommended)

---

### 🛠 MySQL Setup

```bash
mysql -u root -p < sql/create.sql
mysql -u root -p < sql/seed_data.sql
mysql -u root -p < sql/create_procedures.sql
```

---

### 🍃 MongoDB Setup

From Mongo shell:

```js
load("mongodb/initialize-db.mongodb.js")
```

---

### 🚀 Run Dashboard

```bash
cd analytics/
pip install -r requirements.txt
python plot_post_count.py
```

---

## 🖼 Sample Screenshots

- Posts per User 📊
- Like Distribution 💙
- Follower Leaderboard 📢
- Tag Analytics 🏷

---

## 🪪 License

Licensed under the Apache 2.0 License.

---

## 🙌 Credits

Created by **Dhruvin Kheni**  
Database Design, Triggers, Procedures, and MongoDB Aggregation authored by Dhruvin.
