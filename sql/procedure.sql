-- Return the number of posts, comments, and likes for a given user

DELIMITER $$

CREATE PROCEDURE sp_get_user_activity_summary(IN uid INT)
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM post WHERE user_id = uid) AS total_posts,
        (SELECT COUNT(*) FROM comment WHERE user_id = uid) AS total_comments,
        (SELECT COUNT(*) FROM likes WHERE user_id = uid) AS total_likes;
END $$

DELIMITER ;


-- Return the total number of comments and likes on a specific post

DELIMITER $$

CREATE PROCEDURE sp_get_post_engagement(IN pid INT)
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM comment WHERE post_id = pid) AS comment_count,
        (SELECT COUNT(*) FROM likes WHERE post_id = pid) AS like_count;
END $$

DELIMITER ;

-- List top N users ranked by total number of posts

DELIMITER $$

CREATE PROCEDURE sp_get_top_active_users(IN limit_count INT)
BEGIN
    SELECT 
        u.id, u.name, COUNT(p.id) AS total_posts
    FROM 
        user u
    JOIN 
        post p ON u.id = p.user_id
    GROUP BY 
        u.id, u.name
    ORDER BY 
        total_posts DESC
    LIMIT 
        limit_count;
END $$

DELIMITER ;



-- Get unread notifications for a specific user

DELIMITER $$

CREATE PROCEDURE sp_get_notifications_for_user(IN uid INT)
BEGIN
    SELECT id, message, created_at
    FROM notification
    WHERE user_id = uid AND read = FALSE
    ORDER BY created_at DESC;
END $$

DELIMITER ;
