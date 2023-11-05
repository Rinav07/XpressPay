import 'package:flutter/material.dart';
//import 'package:qr_flutter/qr_flutter.dart';
import '../utils/colors.dart';
import 'main_screen.dart';

class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GenerateQrScreenState createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Unique RFID'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                      child: Image.asset(
                    'assets/qr.png',
                    height: 300,
                  )),
                ),
                // Text("Your Unique RFID")
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ElevatedButton.icon(
                    //   onPressed: () {
                    //     // TODO: Implement print functionality
                    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
                    //   },
                    //   icon: const Icon(Icons.print),
                    //   label: const Text('Print'),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: AppColors.primaryColor,
                    //   ),
                    // ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement delivery functionality
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()));
                      },
                      icon: const Icon(Icons.local_shipping),
                      label: const Text('Get it delivered'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // For padding at the bottom
              ],
            ),
    );
  }
}
