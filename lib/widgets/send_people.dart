import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendPeople extends StatelessWidget {
  const SendPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'Send Again',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          trailing: TextButton(onPressed: () {}, child: const Text('See all')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              5,
              (index) => CircleAvatar(
                radius: ScreenUtil().setWidth(28),
                backgroundColor: Colors.transparent,
                backgroundImage: const NetworkImage(
                    'https://randomuser.me/api/portraits/men/43.jpg'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
