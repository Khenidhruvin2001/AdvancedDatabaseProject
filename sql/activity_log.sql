CREATE TABLE IF NOT EXISTS activity_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    action_type VARCHAR(50),
    target_type VARCHAR(50),
    target_id BIGINT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

-- INSERT SAMPLE DATA
INSERT INTO activity_log (user_id, action_type, target_type, target_id, description, created_at) VALUES
(12, 'like', 'post', 15, 'Like post #15', '2025-01-29 22:37:27'),
(9, 'upload', 'post', 13, 'Upload post #13', '2025-02-01 22:37:27'),
(8, 'follow', 'user', 2, 'Follow user #2', '2025-03-25 22:37:27'),
(37, 'report', 'user', 15, 'Report user #15', '2025-01-30 22:37:27'),
(40, 'report', 'post', 15, 'Report post #15', '2025-01-26 22:37:27'),
(15, 'mention', 'user', 11, 'Mention user #11', '2025-03-06 22:37:27'),
(19, 'mention', 'post', 9, 'Mention post #9', '2025-02-14 22:37:27'),
(9, 'follow', 'user', 11, 'Follow user #11', '2025-01-29 22:37:27'),
(14, 'upload', 'user', 2, 'Upload user #2', '2025-03-21 22:37:27'),
(21, 'upload', 'post', 3, 'Upload post #3', '2025-03-01 22:37:27'),
(19, 'report', 'post', 11, 'Report post #11', '2025-03-18 22:37:27'),
(41, 'mention', 'post', 5, 'Mention post #5', '2025-02-12 22:37:27'),
(30, 'like', 'user', 3, 'Like user #3', '2025-03-15 22:37:27'),
(6, 'upload', 'user', 12, 'Upload user #12', '2025-02-09 22:37:27'),
(26, 'like', 'user', 12, 'Like user #12', '2025-03-17 22:37:27');
