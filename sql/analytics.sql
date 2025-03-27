-- Get total number of users
SELECT COUNT(*) AS total_users FROM user;

-- Get total number of posts
SELECT COUNT(*) AS total_posts FROM post;

-- Get average number of posts per user
SELECT AVG(post_count) AS avg_posts_per_user
FROM (
    SELECT COUNT(*) AS post_count
    FROM post
    GROUP BY user_id
) AS user_posts;

-- Get users who haven't posted anything
SELECT u.id, u.name, u.email
FROM user u
LEFT JOIN post p ON u.id = p.user_id
WHERE p.id IS NULL;

-- Top 5 users with the most posts
SELECT u.id, u.name, COUNT(p.id) AS post_count
FROM user u
JOIN post p ON u.id = p.user_id
GROUP BY u.id, u.name
ORDER BY post_count DESC
LIMIT 5;

-- Get all posts and how many likes each received
SELECT p.id AS post_id, p.content, COUNT(l.id) AS like_count
FROM post p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id, p.content;

-- Get posts that have never received any likes
SELECT p.id, p.content
FROM post p
LEFT JOIN likes l ON p.id = l.post_id
WHERE l.id IS NULL;

-- Get most liked post
SELECT p.id, p.content, COUNT(l.id) AS like_count
FROM post p
JOIN likes l ON p.id = l.post_id
GROUP BY p.id, p.content
ORDER BY like_count DESC
LIMIT 1;

-- List all tags used on posts
SELECT DISTINCT t.name AS tag_name
FROM tag t
JOIN post_tag pt ON pt.tag_id = t.id;

-- Count how many times each tag is used
SELECT t.name AS tag_name, COUNT(pt.post_id) AS usage_count
FROM tag t
JOIN post_tag pt ON pt.tag_id = t.id
GROUP BY t.name
ORDER BY usage_count DESC;

-- Get post tag usage per post
SELECT p.id AS post_id, p.content, t.name AS tag_name
FROM post p
JOIN post_tag pt ON p.id = pt.post_id
JOIN tag t ON t.id = pt.tag_id;

-- Find mutual followers (both users follow each other)
SELECT f1.follower_id, f1.following_id
FROM follow f1
JOIN follow f2 ON f1.follower_id = f2.following_id AND f1.following_id = f2.follower_id;

-- Count how many followers each user has
SELECT u.name, COUNT(f.follower_id) AS follower_count
FROM user u
LEFT JOIN follow f ON u.id = f.following_id
GROUP BY u.name;

-- Users with no followers
SELECT u.name
FROM user u
LEFT JOIN follow f ON u.id = f.following_id
WHERE f.follower_id IS NULL;
