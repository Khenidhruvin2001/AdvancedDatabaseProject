
# 📊 Advanced Database Project – Social Media Dashboard

A hybrid database project using **MySQL** and **MongoDB** to simulate a social media platform with features like posts, likes, follows, tags, notifications, and advanced analytics.

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

- CRUD for `stories`, `authors`, and `likes`
- Aggregation pipelines for insights like:
  - Word frequency
  - Story trends over years
  - Most liked stories
  - Tag-based story distribution

---

### 📌 Sample Aggregation

```javascript
db.stories.aggregate([
  { $unwind: "$tags" },
  { $group: { _id: "$tags", count: { $sum: 1 } } },
  { $sort: { count: -1 } }
])
```

---

## 📈 Visual Dashboard

> Built using **Python** and **Plotly Express**  
> Interactive and clean visual representation of key metrics

### Visualizations:
- Posts per User (Bar Chart)
- Likes per Post (Bar Chart)
- Follower Leaderboard (Horizontal Bar Chart)
- Tag Frequency (Pie or Bar Chart)
- MySQL vs MongoDB Query Results Comparison

---

## ⚙️ How to Run

### Prerequisites:
- MySQL 8+
- MongoDB 6+
- Python 3.10+
- VS Code (recommended)

---

### 🛠 Run MySQL Scripts

```bash
mysql -u root -p < sql/create.sql
mysql -u root -p < sql/seed_data.sql
mysql -u root -p < sql/create_procedures.sql
```

---

### 🛠 Run MongoDB Script

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
- Tag Insights 🏷

---

## 🪪 License

This project is licensed under the Apache 2.0 License.

---

## 🙌 Credits

Created by **Dhruvin Kheni**  
Database Design, Triggers, Procedures, and MongoDB Aggregation authored by Dhruvin.
