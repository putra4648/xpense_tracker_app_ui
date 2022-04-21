import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:income_expense_tracker_app/data/transactions.dart';
import 'package:income_expense_tracker_app/utils/currency_format.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 80),
      child: ListTileTheme(
        data: ListTileTheme.of(context).copyWith(
          iconColor: Colors.black,
          textColor: Colors.black,
        ),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Transactions History',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing:
                  TextButton(onPressed: () {}, child: const Text('See all')),
            ),
            ...transactions
                .map(
                  (tx) => ListTile(
                    leading: Container(
                      width: ScreenUtil().setWidth(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(tx['image']!),
                        ),
                      ),
                    ),
                    title: Text(tx['title']!),
                    subtitle: Text(
                      tx['date']!,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: const Color.fromRGBO(102, 102, 102, 1),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    trailing: Text(
                      tx['type']! == 'income'
                          ? "+ " + currencyDollarFormat(tx['amount']!)
                          : "- " + currencyDollarFormat(tx['amount']!),
                      style: TextStyle(
                          color: tx['type']! == 'income'
                              ? Colors.green
                              : Colors.red),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
