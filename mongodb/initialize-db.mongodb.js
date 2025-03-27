use('socialmedia_nosql');

db.comments.insertMany([
  { postId: 1, text: "Awesome post!", timestamp: new Date() },
  { postId: 2, text: "Very helpful!", timestamp: new Date() },
  { postId: 1, text: "Thanks for sharing!", timestamp: new Date() },
  { postId: 3, text: "Could be better.", timestamp: new Date() }
]);

db.likes.insertMany([
  { postId: 1, userId: 1, likedAt: new Date() },
  { postId: 2, userId: 2, likedAt: new Date() },
  { postId: 1, userId: 3, likedAt: new Date() },
  { postId: 3, userId: 1, likedAt: new Date() }
]);

db.notifications.insertMany([
  { userId: 1, message: "New comment on your post", read: false, createdAt: new Date() },
  { userId: 2, message: "You got a new like", read: true, createdAt: new Date() },
  { userId: 3, message: "Someone replied to your comment", read: false, createdAt: new Date() }
]);

db.messages.insertMany([
  { fromUser: 1, toUser: 2, content: "Hello!", sentAt: new Date() },
  { fromUser: 2, toUser: 1, content: "Hey there!", sentAt: new Date() },
  { fromUser: 3, toUser: 1, content: "Can we talk?", sentAt: new Date() },
  { fromUser: 1, toUser: 3, content: "Sure, what's up?", sentAt: new Date() }
]);
