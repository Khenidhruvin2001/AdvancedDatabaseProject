-- USER TABLE
INSERT INTO user (id, name, email, password, created_at) VALUES
(1, 'Alice', 'alice@example.com', 'pass123', NOW()),
(2, 'Bob', 'bob@example.com', 'pass123', NOW()),
(3, 'Charlie', 'charlie@example.com', 'pass123', NOW()),
(4, 'Diana', 'diana@example.com', 'pass123', NOW()),
(5, 'Ethan', 'ethan@example.com', 'pass123', NOW()),
(6, 'Fiona', 'fiona@example.com', 'pass123', NOW()),
(7, 'George', 'george@example.com', 'pass123', NOW()),
(8, 'Hannah', 'hannah@example.com', 'pass123', NOW()),
(9, 'Ian', 'ian@example.com', 'pass123', NOW()),
(10, 'Jenny', 'jenny@example.com', 'pass123', NOW()),
(11, 'Kevin', 'kevin@example.com', 'pass123', NOW()),
(12, 'Laura', 'laura@example.com', 'pass123', NOW()),
(13, 'Mike', 'mike@example.com', 'pass123', NOW()),
(14, 'Nina', 'nina@example.com', 'pass123', NOW()),
(15, 'Oscar', 'oscar@example.com', 'pass123', NOW()),
(16, 'Pam', 'pam@example.com', 'pass123', NOW());

-- POST TABLE
INSERT INTO post (id, user_id, content, created_at) VALUES
(1, 1, 'Post by Alice', NOW()),
(2, 2, 'Post by Bob', NOW()),
(3, 3, 'Post by Charlie', NOW()),
(4, 4, 'Post by Diana', NOW()),
(5, 5, 'Post by Ethan', NOW()),
(6, 6, 'Post by Fiona', NOW()),
(7, 7, 'Post by George', NOW()),
(8, 8, 'Post by Hannah', NOW()),
(9, 9, 'Post by Ian', NOW()),
(10, 10, 'Post by Jenny', NOW()),
(11, 11, 'Post by Kevin', NOW()),
(12, 12, 'Post by Laura', NOW()),
(13, 13, 'Post by Mike', NOW()),
(14, 14, 'Post by Nina', NOW()),
(15, 15, 'Post by Oscar', NOW()),
(16, 16, 'Post by Pam', NOW());

-- NOTIFICATION TABLE
INSERT INTO notification (id, user_id, type, content, seen) VALUES
(1, 1, 'like', 'Someone liked your post', 0),
(2, 2, 'comment', 'New comment on your post', 1),
(3, 3, 'follow', 'You have a new follower', 0),
(4, 4, 'tag', 'You were tagged in a photo', 0),
(5, 5, 'mention', 'You were mentioned', 1),
(6, 6, 'reaction', 'Someone reacted to your post', 0),
(7, 7, 'comment', 'New comment', 1),
(8, 8, 'like', 'Your photo got liked', 0),
(9, 9, 'follow', 'New follower alert', 1),
(10, 10, 'mention', 'Mentioned in a comment', 0),
(11, 11, 'like', 'Post liked', 1),
(12, 12, 'reaction', 'Got a new reaction', 0),
(13, 13, 'follow', 'Follow request', 0),
(14, 14, 'tag', 'Tagged in story', 1),
(15, 15, 'like', 'Image liked', 0),
(16, 16, 'comment', 'Commented by user', 1);

-- MESSAGE TABLE
INSERT INTO message (id, sender_id, receiver_id, text, timestamp) VALUES
(1, 1, 2, 'Hey Bob!', NOW()),
(2, 2, 3, 'Hi Charlie!', NOW()),
(3, 3, 4, 'What’s up?', NOW()),
(4, 4, 5, 'Ready for the game?', NOW()),
(5, 5, 6, 'Yes, excited!', NOW()),
(6, 6, 7, 'Meet at 6 PM?', NOW()),
(7, 7, 8, 'Perfect!', NOW()),
(8, 8, 9, 'Bring snacks!', NOW()),
(9, 9, 10, 'Sure.', NOW()),
(10, 10, 11, 'Coming soon.', NOW()),
(11, 11, 12, 'Update me.', NOW()),
(12, 12, 13, 'Sent the file.', NOW()),
(13, 13, 14, 'Thanks!', NOW()),
(14, 14, 15, 'Check email.', NOW()),
(15, 15, 16, 'Done.', NOW()),
(16, 16, 1, 'Cool.', NOW());

-- MEDIA TABLE
INSERT INTO media (id, post_id, type, url) VALUES
(1, 1, 'image', 'http://img1.com'),
(2, 2, 'video', 'http://video1.com'),
(3, 3, 'image', 'http://img2.com'),
(4, 4, 'image', 'http://img3.com'),
(5, 5, 'video', 'http://video2.com'),
(6, 6, 'image', 'http://img4.com'),
(7, 7, 'video', 'http://video3.com'),
(8, 8, 'image', 'http://img5.com'),
(9, 9, 'image', 'http://img6.com'),
(10, 10, 'video', 'http://video4.com'),
(11, 11, 'image', 'http://img7.com'),
(12, 12, 'image', 'http://img8.com'),
(13, 13, 'video', 'http://video5.com'),
(14, 14, 'image', 'http://img9.com'),
(15, 15, 'image', 'http://img10.com'),
(16, 16, 'video', 'http://video6.com');

-- FOLLOW TABLE
INSERT INTO follow (id, follower_id, following_id, status) VALUES
(1, 1, 2, 'accepted'),
(2, 2, 3, 'pending'),
(3, 3, 4, 'accepted'),
(4, 4, 5, 'accepted'),
(5, 5, 6, 'pending'),
(6, 6, 7, 'accepted'),
(7, 7, 8, 'accepted'),
(8, 8, 9, 'pending'),
(9, 9, 10, 'accepted'),
(10, 10, 11, 'accepted'),
(11, 11, 12, 'pending'),
(12, 12, 13, 'accepted'),
(13, 13, 14, 'pending'),
(14, 14, 15, 'accepted'),
(15, 15, 16, 'pending'),
(16, 16, 1, 'accepted');

-- TAG TABLE
INSERT INTO tag (id, name) VALUES
(1, 'Travel'),
(2, 'Food'),
(3, 'Fitness'),
(4, 'Tech'),
(5, 'Lifestyle'),
(6, 'Music'),
(7, 'Nature'),
(8, 'Movies'),
(9, 'Books'),
(10, 'Gaming'),
(11, 'Pets'),
(12, 'Family'),
(13, 'Education'),
(14, 'Coding'),
(15, 'Design'),
(16, 'Art');

-- POST_TAG TABLE
INSERT INTO post_tag (id, post_id, tag_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16);

-- REPORT TABLE

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE post_likes;
TRUNCATE TABLE report;
TRUNCATE TABLE post_tag;
TRUNCATE TABLE tag;
TRUNCATE TABLE follow;
TRUNCATE TABLE media;
TRUNCATE TABLE message;
TRUNCATE TABLE notification;
TRUNCATE TABLE post;
TRUNCATE TABLE user;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO report (id, user_id, type, target_id, reason) VALUES
(1, 1, 'user', 2, 'Spam'),
(2, 2, 'post', 3, 'Inappropriate content'),
(3, 3, 'user', 4, 'Harassment'),
(4, 4, 'post', 5, 'Offensive language'),
(5, 5, 'user', 6, 'Fake account'),
(6, 6, 'post', 7, 'Violent content'),
(7, 7, 'user', 8, 'Scam'),
(8, 8, 'post', 9, 'Sensitive topic'),
(9, 9, 'user', 10, 'Bullying'),
(10, 10, 'post', 11, 'Copyright issue'),
(11, 11, 'user', 12, 'Troll'),
(12, 12, 'post', 13, 'Hate speech'),
(13, 13, 'user', 14, 'Misinformation'),
(14, 14, 'post', 15, 'Disturbing content'),
(15, 15, 'user', 16, 'Unwanted messages'),
(16, 16, 'post', 1, 'Other');


-- POST_LIKES TABLE
INSERT INTO post_likes (user_id, post_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 1);


INSERT INTO activity_log (user_id, action_type, target_type, target_id, description, created_at) VALUES
(12, 'like', 'post', 15, 'Like post #15', '2025-01-29 22:37:27'),
(9, 'upload', 'post', 13, 'Upload post #13', '2025-02-01 22:37:27'),
(8, 'follow', 'user', 2, 'Follow user #2', '2025-03-25 22:37:27'),
(15, 'mention', 'user', 11, 'Mention user #11', '2025-03-06 22:37:27'),
(19, 'mention', 'post', 9, 'Mention post #9', '2025-02-14 22:37:27'),
(9, 'follow', 'user', 11, 'Follow user #11', '2025-01-29 22:37:27'),
(14, 'upload', 'user', 2, 'Upload user #2', '2025-03-21 22:37:27'),
(21, 'upload', 'post', 3, 'Upload post #3', '2025-03-01 22:37:27'),
(19, 'report', 'post', 11, 'Report post #11', '2025-03-18 22:37:27'),
(6, 'upload', 'user', 12, 'Upload user #12', '2025-02-09 22:37:27');
