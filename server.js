const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// --- Database Connection (Replace with your MongoDB URI) ---
// mongoose.connect('mongodb://localhost:27017/school_app', { useNewUrlParser: true, useUnifiedTopology: true });

// --- Mongoose Models (The Database Structure) ---
const StudentSchema = new mongoose.Schema({
    name: String,
    rollNumber: String,
    class: String,
    attendance: Number, // Percentage
    feesDue: Number,
    homework: [{ subject: String, task: String, dueDate: String }],
    circulars: [{ title: String, date: String, message: String }]
});

const Student = mongoose.model('Student', StudentSchema);

// --- API Endpoints ---

// 1. Get Student Dashboard Data (Mock Login)
app.get('/api/student/:rollNumber', async (req, res) => {
    // In a real app, you would fetch from DB. Here we return mock data matching Optra's features.
    const mockData = {
        name: "Rahul Sharma",
        rollNumber: req.params.rollNumber,
        class: "Class 10 - A",
        attendance: 85.5,
        feesDue: 1500,
        recentHomework: [
            { subject: "Math", task: "Complete Chapter 5 Exercises", dueDate: "2023-10-25" },
            { subject: "Science", task: "Draw diagram of Human Heart", dueDate: "2023-10-26" }
        ],
        notifications: [
            { title: "School Holiday", message: "School closed tomorrow due to heavy rain.", date: "2023-10-24" }
        ]
    };
    res.json(mockData);
});

// 2. Post New Homework (For Teachers/Admin panel)
app.post('/api/homework', async (req, res) => {
    // Logic to save homework to DB would go here
    res.json({ message: "Homework added successfully" });
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
