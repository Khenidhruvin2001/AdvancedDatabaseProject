// Select the correct database
use('socialmedia_nosql')

// Delete a comment by ID
db.comments.deleteOne({ _id: ObjectId("67e0193d8e41286b161e2a97") })

// Delete all likes for a specific post
db.likes.deleteMany({ postId: 2 })

// Delete all messages between two users
db.messages.deleteMany({ fromUser: 1, toUser: 2 })

// Delete all notifications for a user
db.notifications.deleteMany({ userId: 3 })

// Delete all comments for a specific post
db.comments.deleteMany({ postId: 1 })

// Delete all likes by a specific user
db.likes.deleteMany({ userId: 5 })

// Delete all messages sent from a user
db.messages.deleteMany({ fromUser: 1 })

// Delete notifications older than a certain date
db.notifications.deleteMany({ createdAt: { $lt: new Date("2025-03-01T00:00:00Z") } })

// Delete all messages containing specific keyword
db.messages.deleteMany({ content: { $regex: "spam", $options: "i" } })
