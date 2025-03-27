require('dotenv').config();
const { MongoClient } = require('mongodb');

const uri = process.env.MONGODB_URI;

const client = new MongoClient(uri, { useUnifiedTopology: true });

async function connectDB() {
    try {
        await client.connect();
        console.log("✅ Connected to MongoDB at", uri);
        // Example: List all databases
        const databasesList = await client.db().admin().listDatabases();
        console.log("📂 Databases:");
        databasesList.databases.forEach(db => console.log(` - ${db.name}`));
    } catch (err) {
        console.error("❌ MongoDB connection error:", err);
    } finally {
        await client.close();
    }
}

connectDB();