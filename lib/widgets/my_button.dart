import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.isEqual,
  });

  final void Function()? onPressed;
  final Widget? child;
  final bool isEqual;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isEqual
              ? Colors.orange
              : const Color.fromARGB(255, 31, 31, 31),
        ),
        width: 70,
        height: 70,
        child: MaterialButton(onPressed: onPressed, child: child),
      ),
    );
  }
}
