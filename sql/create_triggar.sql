-- Trigger: Track like notification
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


-- Trigger: Delete comments when a post is deleted
DELIMITER $$
CREATE TRIGGER trg_delete_post_comments
AFTER DELETE ON post
FOR EACH ROW
BEGIN
    DELETE FROM comment WHERE post_id = OLD.id;
END $$
DELIMITER ;

-- Trigger: Delete likes when a post is deleted
DELIMITER $$
CREATE TRIGGER trg_delete_post_likes
AFTER DELETE ON post
FOR EACH ROW
BEGIN
    DELETE FROM likes WHERE post_id = OLD.id;
END $$
DELIMITER ;
