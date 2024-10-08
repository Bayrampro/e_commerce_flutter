import 'dart:async';

import 'package:e_commerce/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/bloc/category_bloc/category_bloc.dart';
import 'package:e_commerce/features/CategoryScreen/Category.dart';
import 'package:e_commerce/features/HomeScreen/Home.dart';
import 'package:e_commerce/features/api/models/category.dart';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';
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
    final authTokenRepository = context.read<AuthTokenInterface>();
    bool isAuthenticated = authTokenRepository.isAuthenticated ?? false;
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
            if (mediaQuery.size.width > 1030 && !isAuthenticated)
              AuthDropDown(
                iconData: Icons.key,
                tooltip: 'Авторизация',
                onPressedFirst: () => context.go('/sign-in'),
                onPressedGoogle: () => googleAuthAction(context),
                label: 'Войти',
                buttonIconData: Icons.login,
              ),
            if (mediaQuery.size.width > 1030 && !isAuthenticated)
              AuthDropDown(
                iconData: Icons.person,
                tooltip: 'Регистрация',
                onPressedFirst: () => context.go('/sign-up'),
                onPressedGoogle: () => googleAuthAction(context),
                label: 'Присоедениться',
                buttonIconData: Icons.people_alt_outlined,
              ),
            if (mediaQuery.size.width > 1030 && isAuthenticated)
              AuthButton(
                backgroundColor: theme.primaryColor,
                iconData: Icons.exit_to_app,
                iconColor: theme.cardColor,
                borderSide: BorderSide(color: theme.cardColor, width: 2),
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutEvent());
                  context.go('/sign-in');
                },
                tooltip: 'Выйти',
              ),
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

  Future<void> googleAuthAction(BuildContext context) async {
    final completer = Completer();
    context.read<AuthBloc>().add(
          AuthWithGoogleEvent(
            completer: completer,
          ),
        );
    await completer.future;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
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

class AuthDropDown extends StatelessWidget {
  const AuthDropDown({
    super.key,
    required this.iconData,
    required this.tooltip,
    required this.onPressedFirst,
    required this.label,
    required this.buttonIconData,
    required this.onPressedGoogle,
  });

  final IconData iconData;
  final String tooltip;
  final VoidCallback onPressedFirst;
  final VoidCallback onPressedGoogle;
  final String label;
  final IconData buttonIconData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton(
      icon: Icon(
        iconData,
        color: theme.cardColor,
      ),
      tooltip: tooltip,
      color: theme.cardColor,
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: onPressedFirst,
            label: Text(label),
            icon: Icon(buttonIconData),
          ),
        ),
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'google.png',
                width: 25,
                height: 25,
              ),
              TextButton(
                onPressed: onPressedGoogle,
                child: const Text('с помощью Google'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
