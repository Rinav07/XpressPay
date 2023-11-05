import 'package:flutter/material.dart';
import 'package:xpresspay/screens/generate_qr_screen.dart';
import '../utils/colors.dart';
import '../screens/main_screen.dart'; // Import the main screen

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isLogin = true; // Toggle between Login and Signup

  // Placeholder function for login action
  void _login() {
    // Implement your login logic here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
  }
  void _signup() {
    // Implement your login logic here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GenerateQrScreen()));
  }

  // Placeholder function for Google sign-in
  void _googleSignIn() {
    // Implement your Google sign-in logic here
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              // App logo or image placeholder
              Image.asset('assets/Group 2.png',height: 100),
              const SizedBox(height: 70),

              // Phone number field
              // if (isLogin) ...[
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    prefixIcon: const Icon(Icons.phone, color: AppColors.primaryColor),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 16),
              // ],

              // Email field
              // TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     prefixIcon: Icon(Icons.email, color: AppColors.primaryColor),
              //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              //   ),
              // ),
              // SizedBox(height: 16),

              // Password field
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 24),

              if (!isLogin)...[
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Login/Signup button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: isLogin? _login : _signup,
                child: Text(isLogin ? 'Login' : 'Signup'),
              ),
              const SizedBox(height: 16),

              // Google sign-in button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                icon: Image.asset('assets/GOOG-0ed88f7c.png', height: 24),
                label: Text(isLogin ? 'Login with Google' : 'Signup with Google'),
                onPressed: _googleSignIn,
              ),
              const SizedBox(height: 16),

              // Toggle between Login and Signup
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(isLogin ? 'Don’t have an account? Sign up' : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
