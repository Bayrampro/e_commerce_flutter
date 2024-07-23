import 'package:dio/dio.dart';
import 'package:e_commerce/bloc/category_bloc/category_bloc.dart';
import 'package:e_commerce/bloc/search_bloc/search_bloc.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/features/CategoryScreen/bloc/category_details_bloc.dart';
import 'package:e_commerce/features/DetailScreen/bloc/product_detail_bloc.dart';
import 'package:e_commerce/features/HomeScreen/bloc/products_bloc.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/features/router/router.dart';
import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ProductsApiClient(
      Dio(),
      baseUrl: baseUrl,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(
            productsApiClient: client,
          ),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(
            productsApiClient: client,
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            productsApiClient: client,
          ),
        ),
        BlocProvider(
          create: (context) => CategoryDetailsBloc(
            productsApiClient: client,
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            productsApiClient: client,
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
