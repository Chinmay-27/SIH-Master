import 'package:flutter/material.dart';
import 'page1.dart'; // Import Page1
import 'hospitalPage.dart'; // Import the HospitalPage

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showEmergencyOptions = false;

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Login')),
      );

      // Navigate to Page1
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Page1()),
      );
    }
  }

  void _emergency() {
    setState(() {
      _showEmergencyOptions = true;
    });
  }

  void _handleEmergencyOption(String option) {
    if (option == 'For Me') {
      // Navigate to HospitalPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HospitalPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$option selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the left
          children: [
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 200, // Increased width
                height: 200, // Increased height
              ),
            ),
            const SizedBox(height: 30.0), // Space between logo and text
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Login to continue',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          prefixIcon: Icon(Icons.email), // Mail icon
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          prefixIcon: Icon(Icons.lock), // Lock icon
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          foregroundColor: Colors.white,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Login'),
                            SizedBox(width: 8.0),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _emergency,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Emergency'),
                      ),
                      const SizedBox(height: 16.0),
                      if (_showEmergencyOptions) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => _handleEmergencyOption('For Me'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('For Me'),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _handleEmergencyOption('For Someone Else'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('For Someone Else'),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
