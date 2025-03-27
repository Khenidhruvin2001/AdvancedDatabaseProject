-- Trigger: Notify when a post is liked
DROP TRIGGER IF EXISTS trg_new_like_notification;
DELIMITER $$
CREATE TRIGGER trg_new_like_notification
AFTER INSERT ON post_likes
FOR EACH ROW
BEGIN
    INSERT INTO notification (user_id, message, `read`, created_at)
    VALUES (
        (SELECT user_id FROM post WHERE id = NEW.post_id),
        'Your post was liked',
        FALSE,
        NOW()
    );
END $$
DELIMITER ;

-- Trigger: Notify when a user receives a new message
DROP TRIGGER IF EXISTS trg_new_message_notification;
DELIMITER $$
CREATE TRIGGER trg_new_message_notification
AFTER INSERT ON message
FOR EACH ROW
BEGIN
    INSERT INTO notification (user_id, message, `read`, created_at)
    VALUES (
        NEW.receiver_id,
        CONCAT('You received a new message from user ', NEW.sender_id),
        FALSE,
        NOW()
    );
END $$
DELIMITER ;

-- Trigger: Prevent deletion of users who have posts
DROP TRIGGER IF EXISTS trg_block_user_delete_with_posts;
DELIMITER $$
CREATE TRIGGER trg_block_user_delete_with_posts
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM post WHERE user_id = OLD.id) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete user with existing posts.';
    END IF;
END $$
DELIMITER ;

-- Create audit table for deleted posts
CREATE TABLE IF NOT EXISTS post_audit (
    post_id INT,
    deleted_at DATETIME,
    deleted_by_user_id INT,
    reason VARCHAR(255)
);

-- Trigger: Log deleted posts
DROP TRIGGER IF EXISTS trg_post_delete_log;
DELIMITER $$
CREATE TRIGGER trg_post_delete_log
AFTER DELETE ON post
FOR EACH ROW
BEGIN
    INSERT INTO post_audit (post_id, deleted_at, deleted_by_user_id, reason)
    VALUES (
        OLD.id,
        NOW(),
        OLD.user_id,
        'Post removed by user or admin'
    );
END $$
DELIMITER ;

-- Trigger: Update last_activity when a user creates a post
DROP TRIGGER IF EXISTS trg_update_last_activity;
DELIMITER $$
CREATE TRIGGER trg_update_last_activity
AFTER INSERT ON post
FOR EACH ROW
BEGIN
    UPDATE user
    SET last_activity = NOW()
    WHERE id = NEW.user_id;
END $$
DELIMITER ;

-- Create like_log table if not exists
CREATE TABLE IF NOT EXISTS like_log (
    post_id INT,
    liked_at DATETIME,
    user_id INT
);

-- Trigger: Log likes
DROP TRIGGER IF EXISTS trg_log_like;
DELIMITER $$
CREATE TRIGGER trg_log_like
AFTER INSERT ON post_likes
FOR EACH ROW
BEGIN
    INSERT INTO like_log (post_id, liked_at, user_id)
    VALUES (NEW.post_id, NEW.created_at, NEW.user_id);
END $$
DELIMITER ;

-- Trigger: Validate post content length
DROP TRIGGER IF EXISTS trg_validate_post_content;
DELIMITER $$
CREATE TRIGGER trg_validate_post_content
BEFORE INSERT ON post
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.content) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Post content is too short (minimum 10 characters).';
    ELSEIF LENGTH(NEW.content) > 1000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Post content exceeds maximum length (1000 characters).';
    END IF;
END $$
DELIMITER ;