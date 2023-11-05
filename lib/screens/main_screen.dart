import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../utils/colors.dart';
import '../screens/add_money_screen.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for transactions
    final transactions = [
      Transaction(id: 't1', title: 'Parking', amount: 50.0, date: DateTime.now()),
      Transaction(id: 't2', title: 'McD Drive Through', amount: 450.0, date: DateTime.now().subtract(const Duration(days: 1,hours: 6))),
      Transaction(id: 't3', title: 'Petrol', amount: 1500.0, date: DateTime.now().subtract(const Duration(days: 1))),
      Transaction(id: 't4', title: 'Toll', amount: 100.0, date: DateTime.now()),
      Transaction(id: 't5', title: 'Wallet Recharge', amount: 10000.0, date: DateTime.now()),
      // Add more transactions as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
        ],
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.25,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor,
                ),

                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '₹50,000',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddMoneyScreen()));
              },
              label: const Text('Add Money'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return TransactionItem(transaction: transactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
