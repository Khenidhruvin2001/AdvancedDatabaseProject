-- Average number of posts per user
SELECT 
    AVG(post_count) AS avg_posts_per_user
FROM (
    SELECT 
        u.id,
        COUNT(p.id) AS post_count
    FROM 
        user u
    LEFT JOIN 
        post p ON u.id = p.user_id
    GROUP BY 
        u.id
) AS user_post_counts;

-- Most liked post
SELECT 
    p.id, 
    p.content, 
    COUNT(l.id) AS total_likes
FROM 
    post p
JOIN 
    likes l ON p.id = l.post_id
GROUP BY 
    p.id, p.content
ORDER BY 
    total_likes DESC
LIMIT 1;

-- Total number of users who posted in the last 7 days
SELECT 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    post
WHERE 
    created_at >= CURDATE() - INTERVAL 7 DAY;

-- Top 3 users by number of posts
SELECT 
    u.name, 
    COUNT(p.id) AS total_posts
FROM 
    user u
JOIN 
    post p ON u.id = p.user_id
GROUP BY 
    u.name
ORDER BY 
    total_posts DESC
LIMIT 3;

-- Count of posts per tag
SELECT 
    t.name AS tag_name,
    COUNT(pt.post_id) AS post_count
FROM 
    tag t
JOIN 
    post_tag pt ON t.id = pt.tag_id
GROUP BY 
    t.name;

-- Daily post count
SELECT 
    DATE(created_at) AS post_day,
    COUNT(*) AS total_posts
FROM 
    post
GROUP BY 
    post_day
ORDER BY 
    post_day DESC;
