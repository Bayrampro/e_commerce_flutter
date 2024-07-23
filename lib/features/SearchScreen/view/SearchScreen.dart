import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const NavBar(),
          SearchGrid(
            query: widget.query,
          ),
        ],
      ),
    );
  }
}
