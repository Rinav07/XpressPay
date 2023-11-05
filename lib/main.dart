import 'package:flutter/material.dart';
import '../screens/login_signup_screen.dart';
import '../utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpress Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColor, // Use the custom color for buttons throughout the app
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor, // Use the custom color for elevated buttons
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: AppColors.primaryColor, // Use the custom color for app bars
        ),
      ),
      home: const LoginSignupScreen(), // Set the LoginSignupScreen as the home screen
      debugShowCheckedModeBanner: false, // Hides the debug banner
    );
  }
}
