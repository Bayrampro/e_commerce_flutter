
import 'package:flutter/material.dart';

class AddAndBuyButtons extends StatelessWidget {
  const AddAndBuyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    double verticalPadding = 20.0;
    double horizontalPadding = 45.0;
    double? buttonFontSize = 14.0;
    if(mediaQuery.size.width < 430){
      verticalPadding = 10.0;
      horizontalPadding = 25.0;
      buttonFontSize = 10.0;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: theme.cardColor,
                  width: 2.0,
                ),
                padding: EdgeInsets.all(verticalPadding)
            ),
            child: Text(
              'Добавить в избранное',
              style: theme.textTheme.titleMedium?.copyWith(fontSize: buttonFontSize),
            )
        ),
        const SizedBox(width: 8.0,),
        ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding)
            ),
            child: Text(
              'Купить 50 ₽',
              style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor, fontSize: buttonFontSize),
            )
        ),
      ],
    );
  }
}