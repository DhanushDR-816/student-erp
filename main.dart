import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolParentApp());
}

class SchoolParentApp extends StatelessWidget {
  const SchoolParentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Parent App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Student Data
    const studentName = "Rahul Kumar";
    const className = "Class X - A";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent Portal"),
        backgroundColor: const Color(0xFF00569E), // Optra-like Blue
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Student Profile Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF00569E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with student image
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      studentName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      className,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),

          // 2. Dashboard Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(15),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                _buildMenuCard(Icons.calendar_today, "Attendance", Colors.orange, context),
                _buildMenuCard(Icons.book, "Homework", Colors.green, context),
                _buildMenuCard(Icons.payment, "Fees", Colors.purple, context),
                _buildMenuCard(Icons.analytics, "Results", Colors.red, context),
                _buildMenuCard(Icons.schedule, "Timetable", Colors.blue, context),
                _buildMenuCard(Icons.campaign, "Circulars", Colors.teal, context),
                _buildMenuCard(Icons.photo_library, "Gallery", Colors.pink, context),
                _buildMenuCard(Icons.bus_alert, "Transport", Colors.amber, context),
                _buildMenuCard(Icons.person, "Profile", Colors.indigo, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget builder for Menu Cards
  Widget _buildMenuCard(IconData icon, String title, Color color, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          // Navigate to specific pages here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Opening $title...")),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
