import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/search_bloc/search_bloc.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    this.searchFieldWidth,
    this.bottomPadding,
  });

  final double? searchFieldWidth;
  final double? bottomPadding;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    final theme = Theme.of(context);
    return SizedBox(
      width: widget.searchFieldWidth,
      child: GestureDetector(
        onTap: () => goToSearch(context, controller),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30)
              .copyWith(bottom: widget.bottomPadding),
          child: Container(
            decoration: BoxDecoration(
                color: theme.canvasColor,
                borderRadius: BorderRadius.circular(7)),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'Введите название товара...',
                        hintStyle: TextStyle(
                          color: theme.hintColor.withOpacity(0.5),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.search,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goToSearch(BuildContext context, TextEditingController controller) {
    BlocProvider.of<SearchBloc>(context)
        .add(LoadSearchEvent(query: controller.text));
    if (controller.text != '') {
      context.go('/search/${controller.text}');
    }
  }
}
