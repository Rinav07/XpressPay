import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of payment options, could be replaced with dynamic data
    final paymentOptions = [
      {'name': 'Credit / Debit Card', 'icon': Icons.credit_card},
      {'name': 'Net Banking', 'icon': Icons.account_balance},
      {'name': 'UPI', 'icon': Icons.phone_android},
      {'name': 'Paytm', 'icon': Icons.payment},
      {'name': 'Pay Later', 'icon': Icons.watch_later_outlined},
      // Add more payment options here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.currency_rupee, color: AppColors.primaryColor),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentOptions.length,
              separatorBuilder: (context, index) => const Divider(color: AppColors.primaryColor),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(paymentOptions[index]['icon'] as IconData?, color: AppColors.primaryColor),
                  title: Text(paymentOptions[index]['name'] as String),
                  onTap: () {
                    // Placeholder for payment option tap handler
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
