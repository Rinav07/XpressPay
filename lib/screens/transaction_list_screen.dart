import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_item.dart';
import '../utils/colors.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for transactions
    final transactions = [
      Transaction(id: 't1', title: 'Groceries', amount: 500.0, date: DateTime.now()),
      Transaction(id: 't2', title: 'Electricity Bill', amount: 1500.0, date: DateTime.now().subtract(const Duration(days: 1))),
      Transaction(id: 't3', title: 'Online Shopping', amount: 2500.0, date: DateTime.now().subtract(const Duration(days: 3))),
      Transaction(id: 't4', title: 'Gym Membership', amount: 800.0, date: DateTime.now().subtract(const Duration(days: 7))),
      // Add more transactions as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Transactions'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return TransactionItem(transaction: transactions[index]);
        },
      ),
    );
  }
}
