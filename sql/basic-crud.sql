-- Get all posts with user info
SELECT 
    p.id AS post_id,
    p.content,
    u.name AS author
FROM 
    post p
JOIN 
    user u ON p.user_id = u.id;

-- Get all tags for a post
SELECT 
    pt.post_id,
    t.name AS tag
FROM 
    post_tag pt
JOIN 
    tag t ON pt.tag_id = t.id
WHERE 
    pt.post_id = 5;

-- Count total posts by each user
SELECT 
    u.name,
    COUNT(p.id) AS total_posts
FROM 
    user u
LEFT JOIN 
    post p ON u.id = p.user_id
GROUP BY 
    u.name;

-- Find all posts tagged with 'hello'
SELECT 
    p.id, 
    p.content
FROM 
    post p
JOIN 
    post_tag pt ON p.id = pt.post_id
JOIN 
    tag t ON pt.tag_id = t.id
WHERE 
    t.name = 'hello';

-- Users who haven’t made any posts
SELECT 
    u.id, 
    u.name
FROM 
    user u
LEFT JOIN 
    post p ON u.id = p.user_id
WHERE 
    p.id IS NULL;

-- Latest 5 posts
SELECT 
    * 
FROM 
    post 
ORDER BY 
    created_at DESC 
LIMIT 5;

-- Total likes per post
SELECT 
    p.id AS post_id,
    p.content,
    COUNT(l.id) AS like_count
FROM 
    post p
LEFT JOIN 
    likes l ON p.id = l.post_id
GROUP BY 
    p.id, p.content;
