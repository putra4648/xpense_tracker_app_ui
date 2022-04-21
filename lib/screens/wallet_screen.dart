import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:income_expense_tracker_app/widgets/header.dart';

import '../data/transactions.dart';
import '../utils/currency_format.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String selectedMenu = 'Transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Wallet'),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              child: const Icon(
                Icons.notifications_outlined,
              ),
              badgeColor: const Color(0xffFFAB7B),
              position: BadgePosition.topEnd(top: 3, end: 1),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Header(
            height: 0.4,
            child: Positioned(
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text('Total Balance'),
                const SizedBox(height: 10),
                Text(
                  currencyDollarFormat('30000'),
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icons.add,
                    Icons.dashboard_customize,
                    Icons.send,
                  ]
                      .map(
                        (icon) => Container(
                          margin: const EdgeInsetsDirectional.only(start: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              icon,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  child: Row(
                    children: ['Transactions', 'Upcoming Bills']
                        .map(
                          (data) => Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMenu = data;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(30),
                                  color: selectedMenu.contains(data)
                                      ? Colors.white
                                      : null,
                                ),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  data,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
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
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
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
        ],
      ),
    );
  }
}
