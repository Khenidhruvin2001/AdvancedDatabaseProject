import mysql.connector
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="admin123",
    database="socialmedia"
)
cursor = conn.cursor()

# 1. Most Active Users (Posts)
cursor.execute("""
    SELECT u.name, COUNT(p.id) AS post_count
    FROM user u
    JOIN post p ON u.id = p.user_id
    GROUP BY u.name
    ORDER BY post_count DESC
    LIMIT 10
""")
active_users = cursor.fetchall()

# 2. Most Liked Posts
cursor.execute("""
    SELECT p.id, COUNT(pl.user_id) AS like_count
    FROM post p
    JOIN post_likes pl ON p.id = pl.post_id
    GROUP BY p.id
    ORDER BY like_count DESC
    LIMIT 10
""")
most_liked_posts = cursor.fetchall()

# 3. Top Followed Users
cursor.execute("""
    SELECT u.name, COUNT(f.follower_id) AS followers
    FROM user u
    JOIN follow f ON u.id = f.following_id
    GROUP BY u.name
    ORDER BY followers DESC
    LIMIT 10
""")
top_followed_users = cursor.fetchall()

# 4. Most Tagged Posts
cursor.execute("""
    SELECT pt.post_id, COUNT(pt.tag_id) AS tag_count
    FROM post_tag pt
    GROUP BY pt.post_id
    ORDER BY tag_count DESC
    LIMIT 10
""")
most_tagged_posts = cursor.fetchall()

cursor.close()
conn.close()

# Create beautiful subplot layout
fig = make_subplots(
    rows=2, cols=2,
    subplot_titles=(
        "📌 Top 10 Active Users by Posts",
        "❤️ Top 10 Liked Posts",
        "👥 Top 10 Followed Users",
        "🏷️ Top 10 Tagged Posts"
    )
)

# 1. Active Users
fig.add_trace(
    go.Bar(
        x=[x[0] for x in active_users],
        y=[x[1] for x in active_users],
        marker_color='royalblue'
    ), row=1, col=1
)

# 2. Liked Posts
fig.add_trace(
    go.Bar(
        x=[f"Post #{x[0]}" for x in most_liked_posts],
        y=[x[1] for x in most_liked_posts],
        marker_color='indianred'
    ), row=1, col=2
)

# 3. Followed Users
fig.add_trace(
    go.Bar(
        x=[x[0] for x in top_followed_users],
        y=[x[1] for x in top_followed_users],
        marker_color='seagreen'
    ), row=2, col=1
)

# 4. Tagged Posts
fig.add_trace(
    go.Bar(
        x=[f"Post #{x[0]}" for x in most_tagged_posts],
        y=[x[1] for x in most_tagged_posts],
        marker_color='mediumpurple'
    ), row=2, col=2
)

# Final layout
fig.update_layout(
    title="📊 Social Media Dashboard Overview",
    height=750,
    width=1150,
    showlegend=False,
    template='plotly_dark'
)

fig.show()
