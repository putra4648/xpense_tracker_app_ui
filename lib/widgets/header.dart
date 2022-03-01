import 'package:flutter/material.dart';

import 'account_info.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(66, 150, 144, 1),
            Color.fromRGBO(42, 124, 118, 1),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.elliptical(150, 50),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: [
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: MediaQuery.of(context).size.width / 3,
            child: Image.asset('assets/ellipse_9.png'),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: MediaQuery.of(context).size.width / 6,
            child: Image.asset('assets/ellipse_8.png'),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            child: Image.asset('assets/ellipse_7.png'),
          ),
          const Positioned.fill(
            bottom: -100,
            child: AccountInformation(),
          )
        ],
      ),
    );
  }
}
