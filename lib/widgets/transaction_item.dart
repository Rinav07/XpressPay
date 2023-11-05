import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../utils/colors.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        child: Text(transaction.title[0]), // Just showing the first letter
      ),
      title: Text(transaction.title),
      subtitle: Text(transaction.date.toString()),
      trailing: (transaction.title == 'Wallet Recharge')?Text('+ ₹${transaction.amount}',style: TextStyle(color: Colors.green),):Text('- ₹${transaction.amount}',style: TextStyle(color: Colors.red),),
    );
  }
}
