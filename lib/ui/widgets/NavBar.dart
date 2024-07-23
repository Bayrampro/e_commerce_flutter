import 'dart:developer';

import 'package:e_commerce/bloc/category_bloc/category_bloc.dart';
import 'package:e_commerce/features/CategoryScreen/Category.dart';
import 'package:e_commerce/features/api/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../ui.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(const LoadCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    double? searchFieldWidth = 450.0;
    if (MediaQuery.of(context).size.width < 525) {
      searchFieldWidth = 300.0;
    }
    return SliverAppBar(
      toolbarHeight: 80,
      leadingWidth: 90,
      backgroundColor: theme.primaryColor,
      surfaceTintColor: theme.primaryColor,
      leading: Image.asset(
        'logo.png',
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavButtons(
              showCategoryDialog: _showCategoryDialog,
            ),
            if (mediaQuery.size.width > 375)
              SearchField(
                searchFieldWidth: searchFieldWidth,
              ),
            if (mediaQuery.size.width > 1030)
              LocalizationButtons(
                color: theme.cardColor,
              ),
            if (mediaQuery.size.width > 1030) const ShopBasket(),
            if (mediaQuery.size.width > 1030) const AuthButton(),
          ],
        ),
      ),
      actions: mediaQuery.size.width < 1030
          ? <Widget>[
              DropDownResponsiveMenu(
                showCategoryDialog: _showCategoryDialog,
              )
            ]
          : [],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.width < 375 ? 70.0 : 0),
        child: mediaQuery.size.width < 375
            ? SearchField(
                searchFieldWidth: searchFieldWidth,
                bottomPadding: 8.0,
              )
            : const SizedBox(),
      ),
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Категории'),
          content: SizedBox(
            width: 300,
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                log(state.toString());
                if (state is! CategoryLoaded) {
                  return Container();
                }
                final categories = state.categories;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(categories[index].name),
                      onTap: () =>
                          goToCategoryDetails(context, categories, index),
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            )
          ],
        );
      },
    );
  }

  void goToCategoryDetails(
      BuildContext context, List<Category> categories, int index) {
    return setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryScreen(
            slug: categories[index].slug,
          ),
        ),
      );
      context.go('/category/${categories[index].slug}');
    });
  }
}
