// page1.dart
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Page 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Adds spacing between the text and button
            ElevatedButton(
              onPressed: () {
                // Save action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data saved successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
