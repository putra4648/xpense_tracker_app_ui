import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'background_button.dart';
import 'custom_listile.dart';
import 'total_balance.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          title: const Text(
            'Good Afternoon,',
          ),
          subtitle: Text(
            'Enjelin Morgeana',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          trailing: BackgroundButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Badge(
              child: Icon(
                Icons.notifications_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              badgeColor: const Color(0xffFFAB7B),
              position: BadgePosition.topEnd(top: 3, end: 1),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(47, 126, 121, 1),
          ),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                offset: const Offset(10, 30),
                blurRadius: 50,
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                offset: const Offset(-10, 30),
                blurRadius: 50,
              ),
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TotalBalance(),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    CustomListTile(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      icons: Icons.arrow_downward,
                      title: 'Income',
                      money: '5000',
                    ),
                    Spacer(),
                    CustomListTile(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      icons: Icons.arrow_upward,
                      money: '150',
                      title: 'Expenses',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
