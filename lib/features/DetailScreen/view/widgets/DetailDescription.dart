import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AutoSizeText(
              description,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
              maxLines: 10,
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
