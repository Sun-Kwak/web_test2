import 'package:flutter/material.dart';

class SlideFadeSwitcher extends StatelessWidget {
  final Widget child;

  const SlideFadeSwitcher({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: ((child, animation) {
        final offsetAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation);
        final fadeAnimation = Tween<double>(begin: 0.0, end: 0.8).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      }),
      duration: const Duration(
        milliseconds: 800,
      ),
      child: child,
    );
  }
}
