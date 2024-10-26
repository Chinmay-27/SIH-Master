import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dhayan Park',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Your area',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
        actionsIconTheme: const IconThemeData(color: Colors.white), // Set action icons color to white
      ),
      body: SafeArea(
        child: Container(
          color: Colors.lightBlue[50], // Set the background color to match MyHomePage
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjusted vertical padding
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Space between search bar and list

              // Hospital List
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Limit to 5 hospitals
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0), // Increased margin
                      child: SizedBox(
                        height: 150, // Increased height of each card
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4, // Add shadow effect
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Text(
                              'Hospital ${index + 1}', // Replace with actual hospital name
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Address of Hospital ${index + 1}', // Replace with actual address
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  '33 Beds', // Replace with actual bed count
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space evenly
                              mainAxisSize: MainAxisSize.min, // Make sure Row takes only necessary space
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.phone),
                                  color: Colors.blue[900],
                                  onPressed: () {
                                    // Handle call action
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle request action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[900], // Button color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    foregroundColor: Colors.white, // Text color
                                  ),
                                  child: const Text('Request'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
