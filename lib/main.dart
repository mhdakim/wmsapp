import 'package:flutter/material.dart';
import 'dashboard.dart';
//import 'home.dart';  // Import the home.dart page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();  // Form Key to validate fields

  // Controller for the TextFields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;  // Add this line to manage the visibility state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00124E), // Navy blue background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Section
              Image.asset(
                'lib/assets/logo.png', // Replace with your logo asset path
                height: 120,
              ),
              const SizedBox(height: 16),
              // Title Section
              const Text(
                'WAREHOUSE MANAGEMENT SYSTEM',
                textAlign: TextAlign.center, // Center align text here
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'SECURIFORCE LOGISTIC SDN BHD',
                textAlign: TextAlign.center, // Center align text here
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFEF202), // Change to new gold color
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              // Sign In Form
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  key: _formKey, // Use formKey to validate the form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center, // Center align text here
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00124E), // Navy text color
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Welcome to WMS App',
                          textAlign: TextAlign.center, // Center align text here
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6E829F),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Email Field
                      const Text(
                        'Email*',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color(0xFF6E829F),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFF1B2346), // Custom border color
                              width: 1,
                            ),
                          ),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(color: Color(0xFF6E829F)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password Field
                      const Text(
                        'Password*',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isPasswordHidden,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFF6E829F),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordHidden ? Icons.visibility_off : Icons.visibility,  // Toggle the icon based on visibility state
                              color: Color(0xFF6E829F),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordHidden = !_isPasswordHidden;  // Toggle the state to show/hide password
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFF1B2346), // Custom border color
                              width: 1,
                            ),
                          ),
                          hintText: 'Enter Your Password',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // If form is valid, navigate to Home
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const DashboardPage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00124E), // Navy blue button
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
