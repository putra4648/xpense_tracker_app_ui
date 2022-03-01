import 'package:flutter/material.dart';

class BackgroundButton extends StatelessWidget {
  const BackgroundButton({
    Key? key,
    required this.child,
    required this.shape,
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.1),
      shape: shape,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: padding,
          child: FittedBox(child: child),
        ),
      ),
    );
  }
}
