-- Get all posts with user name and post content
SELECT 
    p.id AS post_id,
    p.content,
    u.name AS posted_by
FROM 
    post p
JOIN 
    user u ON p.user_id = u.id;

-- Get all tags assigned to a post
SELECT 
    pt.post_id,
    t.name AS tag_name
FROM 
    post_tag pt
JOIN 
    tag t ON pt.tag_id = t.id;

-- Get user and their liked post IDs
SELECT 
    u.name AS user_name,
    pl.post_id
FROM 
    user u
JOIN 
    post_likes pl ON u.id = pl.user_id;


-- Get all posts with their tags and author's name
SELECT 
    p.content AS post_content,
    t.name AS tag_name,
    u.name AS author
FROM 
    post p
JOIN 
    post_tag pt ON p.id = pt.post_id
JOIN 
    tag t ON pt.tag_id = t.id
JOIN 
    user u ON p.user_id = u.id;

-- Count how many tags each post has
SELECT 
    p.id AS post_id,
    COUNT(pt.tag_id) AS tag_count
FROM 
    post p  
LEFT JOIN 
    post_tag pt ON p.id = pt.post_id
GROUP BY 
    p.id;
