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


---

## ✅ MySQL Implementation

### 📌 Features

- **Relational schema** for social media:
  - `user`, `post`, `post_likes`, `post_tags`, `follow`, `notification`, etc.
- **Stored Procedures**:
  - Add posts, update activity logs, notify on new likes
- **Triggers**:
  - Auto-update `last_activity`, prevent deletion of users with posts
- **Analytics**:
  - Most liked posts
  - Most active users
  - Most followed users
  - Most tagged content

### 🧪 Sample Queries

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


🍃 MongoDB Implementation
📌 Features
CRUD for stories, authors, likes

Aggregation Pipelines:

Word counts

Story trends by year

Story popularity

🧪 Sample Aggregation
db.stories.aggregate([
  { $unwind: "$tags" },
  { $group: { _id: "$tags", count: { $sum: 1 } } },
  { $sort: { count: -1 } }
])

📊 Visual Dashboard
Tools Used:
Python + Plotly Express

Dash App (optional)

Visualizations:
Posts per User

Likes per Post

Follower Leaderboard

Tag Frequency

MongoDB vs MySQL comparison

⚙️ How to Run
Prerequisites
MySQL 8+

MongoDB 6+

Python 3.10+

VSCode recommended

Run MySQL Scripts
# Load schema and seed data
mysql -u root -p < sql/create.sql
mysql -u root -p < sql/seed_data.sql
mysql -u root -p < sql/create_procedures.sql

Run MongoDB Scripts
# From Mongo shell
load("mongodb/initialize-db.mongodb.js")

Run Dashboard
cd analytics/
pip install -r requirements.txt
python plot_post_count.py


📸 Sample Screenshots 

Posts per User

Like Distribution

Follower Leaderboard

📜 License
This project is licensed under the Apache 2.0 License.

🙌 Credits
Created by Dhruvin Kheni  

Database Design, Triggers, Procedures, and MongoDB Aggregation by Dhruvin


