import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:income_expense_tracker_app/utils/currency_format.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final _transactions = <Map<String, String>>[
    {
      'title': 'Upwork',
      'date': 'Today',
      'type': 'expense',
      'image':
          'https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/50/000000/external-upwork-a-global-freelancing-platform-where-professionals-connect-and-collaborate-remotely-logo-shadow-tal-revivo.png',
      'amount': '850000',
    },
    {
      'title': 'Paypal',
      'date': 'Yesterday',
      'type': 'income',
      'image': 'https://img.icons8.com/color/50/000000/paypal.png',
      'amount': '85000',
    },
    {
      'title': 'Transfer',
      'date': '1 February 2022',
      'image': 'https://randomuser.me/api/portraits/men/66.jpg',
      'type': 'income',
      'amount': '5000',
    },
    {
      'title': 'Youtube',
      'date': 'Now',
      'type': 'expense',
      'image': 'https://img.icons8.com/color/50/000000/youtube-play.png',
      'amount': '1000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 80),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Transactions History',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            trailing:
                TextButton(onPressed: () {}, child: const Text('See all')),
          ),
          ..._transactions
              .map(
                (tx) => ListTile(
                  leading: Container(
                    width: ScreenUtil().setWidth(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(tx['image']!),
                      ),
                    ),
                  ),
                  title: Text(
                    tx['title']!,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
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
    );
  }
}
