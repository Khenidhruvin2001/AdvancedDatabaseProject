USE socialmedia;

-- Stored Procedure: Get User Activity Summary
DROP PROCEDURE IF EXISTS sp_get_user_activity_summary;
DELIMITER //

CREATE PROCEDURE sp_get_user_activity_summary(IN uid INT)
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM post WHERE user_id = uid) AS total_posts,
        (SELECT COUNT(*) FROM post_likes WHERE user_id = uid) AS total_likes;
END //

DELIMITER ;


-- Stored Procedure: Get Post Engagement
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_get_post_engagement;
DELIMITER $$

CREATE PROCEDURE sp_get_post_engagement(IN pid INT)
BEGIN
    -- comment_count skipped
    SELECT 
        (SELECT COUNT(*) FROM post_likes WHERE post_id = pid) AS like_count;
END $$

DELIMITER ;


-- Stored Procedure: Top Active Users
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

-- Stored Procedure: Get Notifications for User
DROP PROCEDURE IF EXISTS sp_get_post_engagement;
DELIMITER $$

CREATE PROCEDURE sp_get_notifications_for_user(IN uid INT)
BEGIN
    SELECT id, message, created_at
    FROM notification
    WHERE user_id = uid AND read = FALSE
    ORDER BY created_at DESC;
END $$

DELIMITER ;
