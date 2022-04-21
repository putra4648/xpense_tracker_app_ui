import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:income_expense_tracker_app/data/accounts.dart';
import 'package:income_expense_tracker_app/widgets/header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Header(
            child: Positioned(
              left: 0,
              right: 0,
              bottom: -100,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: ScreenUtil().setHeight(48),
                    backgroundColor: Colors.white,
                    child: FlutterLogo(
                      size: ScreenUtil().setHeight(48),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Text(
                    'Jonatahan Buddy',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(5),
                  ),
                  Text(
                    'jonathan@yahoo.co.uk',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
                children: accountMenus
                    .map(
                      (acc) => acc['id']! as int == 0
                          ? Column(
                              children: [
                                ListTile(
                                  title: Text(acc['name'] as String),
                                  leading: Icon(acc['icon'] as IconData),
                                ),
                                const Divider(indent: 20, endIndent: 20)
                              ],
                            )
                          : ListTile(
                              title: Text(acc['name'] as String),
                              leading: Icon(acc['icon'] as IconData),
                            ),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
