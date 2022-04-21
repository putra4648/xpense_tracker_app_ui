import 'package:flutter/material.dart';
import 'package:income_expense_tracker_app/utils/currency_format.dart';

import 'background_button.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.icons,
    required this.title,
    required this.money,
    required this.crossAxisAlignment,
  }) : super(key: key);

  final String title;
  final String money;
  final IconData icons;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              BackgroundButton(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icons,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                shape: const CircleBorder(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          child: Text(
            currencyDollarFormat(money),
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        )
      ],
    );
  }
}
