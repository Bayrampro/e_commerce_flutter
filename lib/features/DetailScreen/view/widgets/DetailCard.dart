import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.child,
    required this.height
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: theme.primaryColor,
      ),
      child: child,
    );
  }
}