import 'package:flutter/material.dart';
import 'package:xpresspay/screens/generate_qr_screen.dart';
import '../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers to manage form inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isEditing = false;

  // Initialize with mock data
  @override
  void initState() {
    super.initState();
    _nameController.text = 'Akshat Bhardwaj'; // Replace with actual user name
    _emailController.text = 'bhardwajakshat842@gmail.com'; // Replace with actual email
    _phoneController.text = '+91 9247927942'; // Replace with actual phone number
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(child: const Text('Unique RFID')),
            const SizedBox(height: 7),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenerateQrScreen()));
                },
                child: Image.asset(
                  'assets/qr.png',
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              readOnly: !_isEditing,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              readOnly: !_isEditing,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement save profile logic
                  setState(() {
                    _isEditing = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: const Text('Save Changes'),
              ),
          ],
        ),
      ),
    );
  }
}
