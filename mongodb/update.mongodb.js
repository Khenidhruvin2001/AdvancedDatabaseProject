// Select the correct database
use('socialmedia_nosql')
 
// Mark all notifications as read for a user
db.notifications.updateMany(
  { userId: 3, read: false },
  { $set: { read: true } }
);

// Update the text of a comment
db.comments.updateOne(
  { _id: ObjectId("67e019d18e41286b161e2a98") },
  { $set: { text: "You can show comment" } }
);

// Update message content
db.messages.updateOne(
  { _id: ObjectId("INSERT_MESSAGE_ID_HERE") },
  { $set: { content: "Updated message content" } }
);
