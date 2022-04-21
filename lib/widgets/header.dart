import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({Key? key, this.child, this.height = 0.35}) : super(key: key);

  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().screenHeight * height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff429690), Color(0xff2A7C76)],
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
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
