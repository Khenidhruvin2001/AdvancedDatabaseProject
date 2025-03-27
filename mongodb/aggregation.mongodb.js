// Use your social media MongoDB database
use("socialmedia_nosql");

// Aggregation 1: Count total likes per post
db.likes.aggregate([
  {
    $group: {
      _id: "$postId",
      totalLikes: { $sum: 1 }
    }
  },
  {
    $sort: { totalLikes: -1 }
  }
]);

// Aggregation 2: Count total comments per post
db.comments.aggregate([
  {
    $group: {
      _id: "$postId",
      totalComments: { $sum: 1 }
    }
  },
  {
    $sort: { totalComments: -1 }
  }
]);

// Aggregation 3: Notifications per user (unread count)
db.notifications.aggregate([
  {
    $match: { read: false }
  },
  {
    $group: {
      _id: "$userId",
      unreadCount: { $sum: 1 }
    }
  }
]);

// Aggregation 4: Message activity - how many messages each user sent
db.messages.aggregate([
  {
    $group: {
      _id: "$fromUser",
      messagesSent: { $sum: 1 }
    }
  },
  {
    $sort: { messagesSent: -1 }
  }
]);

// Aggregation 5: Messages between user pairs (chats)
db.messages.aggregate([
  {
    $group: {
      _id: { from: "$fromUser", to: "$toUser" },
      totalChats: { $sum: 1 }
    }
  }
]);

// Aggregation 6: Latest comment timestamp per post
db.comments.aggregate([
  {
    $group: {
      _id: "$postId",
      lastCommentedAt: { $max: "$timestamp" }
    }
  },
  {
    $sort: { lastCommentedAt: -1 }
  }
]);

// Get total likes per post (most liked posts at top)
db.likes.aggregate([
  {
    $group: {
      _id: "$postId",             // Group by postId
      totalLikes: { $sum: 1 }     // Count number of likes
    }
  },
  {
    $sort: { totalLikes: -1 }     // Sort descending by totalLikes
  }
]);
 
// Count how many comments are on each post 
db.comments.aggregate([
  {
    $group: {
      _id: "$postId",             // Group by postId
      totalComments: { $sum: 1 }  // Count number of comments
    }
  },
  {
    $sort: { totalComments: -1 } // Sort descending by comment count
  }
]);
 
// Count unread notifications per user 
db.notifications.aggregate([
  {
    $match: { read: false }       // Only unread notifications
  },
  {
    $group: {
      _id: "$userId",             // Group by userId
      unreadCount: { $sum: 1 }    // Count unread notifications
    }
  }
]);
 
// Count how many messages each user has sent 
db.messages.aggregate([
  {
    $group: {
      _id: "$fromUser",           // Group by sender
      totalSentMessages: { $sum: 1 }
    }
  },
  {
    $sort: { totalSentMessages: -1 } // Sort by most active senders
  }
]);
