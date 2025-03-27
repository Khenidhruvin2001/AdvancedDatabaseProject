# delete_queries.py

from pymongo import MongoClient # type: ignore
from bson.objectid import ObjectId # type: ignore
 
client = MongoClient("mongodb://localhost:27017/")
 
db = client["socialmedia_nosql"]
 
comment_id = "67e019d18e41286b161e2a98"
db.comments.delete_one({"_id": ObjectId(comment_id)})
 
db.likes.delete_many({"postId": 2})

db.messages.delete_many({"fromUser": 1, "toUser": 2})

db.notifications.delete_many({"userId": 3})

db.comments.delete_many({"postId": 1})

db.likes.delete_many({"userId": 5})

db.messages.delete_many({"fromUser": 1})

from datetime import datetime
cutoff = datetime(2025, 3, 1)
db.notifications.delete_many({"createdAt": {"$lt": cutoff}})

db.messages.delete_many({"content": {"$regex": "spam", "$options": "i"}})

print("✅ Delete operations completed.")
