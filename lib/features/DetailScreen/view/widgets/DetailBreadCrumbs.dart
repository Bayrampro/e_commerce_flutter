import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class DetailBreadCrumb extends StatelessWidget {
  const DetailBreadCrumb({
    super.key,
    required this.category,
    required this.name,
  });

  final String category;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0).copyWith(bottom: 6),
      child: BreadCrumb(
        items: <BreadCrumbItem>[
          BreadCrumbItem(content: Text(category)),
          BreadCrumbItem(content: Text(name)),
        ],
        divider: const Icon(Icons.chevron_right),
      ),
    );
  }
}
