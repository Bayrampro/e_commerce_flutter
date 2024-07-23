import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    super.key,
    required this.headTitle,
    required this.smallTitle,
  });

  final String headTitle;
  final String smallTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            headTitle,
            style: mediaQuery.size.width > 350 ?
            theme.textTheme.headlineSmall :
            theme.textTheme.headlineSmall?.copyWith(fontSize: 15),
          ),
          const SizedBox(width: 15,),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              smallTitle,
              style: mediaQuery.size.width > 350 ?
              theme.textTheme.titleMedium?.copyWith(
                color: theme.hintColor,
              ) :
              theme.textTheme.titleMedium?.copyWith(
                color: theme.hintColor,
                fontSize: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
