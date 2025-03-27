use('socialmedia_nosql');

// Find all comments for a specific post
db.comments.find({ postId: 1 });

// Find all likes by a specific user
db.likes.find({ userId: 2 });

// Find unread notifications for a user
db.notifications.find({ userId: 2, read: false });

// Find all messages between two users
db.messages.find({
  $or: [
    { fromUser: 3, toUser: 6 },
    { fromUser: 4, toUser: 8 }
  ]
});

// Find the most recent 3 comments
db.comments.find().sort({ timestamp: -1 }).limit(3);

// Find messages containing the word "urgent"
db.messages.find({ content: { $regex: "urgent", $options: "i" } });

// Count total likes on a post
db.likes.countDocuments({ postId: 5 });
