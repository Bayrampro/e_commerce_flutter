import 'package:dio/dio.dart';
import 'package:e_commerce/bloc/auth_bloc/auth_bloc.dart';
import 'package:e_commerce/bloc/category_bloc/category_bloc.dart';
import 'package:e_commerce/bloc/search_bloc/search_bloc.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/features/CategoryScreen/bloc/category_details_bloc.dart';
import 'package:e_commerce/features/DetailScreen/bloc/product_detail_bloc.dart';
import 'package:e_commerce/features/HomeScreen/bloc/products_bloc.dart';
import 'package:e_commerce/features/api/api.dart';
import 'package:e_commerce/features/router/router.dart';
import 'package:e_commerce/repositories/auth_token/auth_token.dart';
import 'package:e_commerce/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({
    super.key,
    required this.prefs,
    required this.dio,
  });

  final SharedPreferences prefs;
  final Dio dio;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProductsApiClient(
            dio,
            baseUrl: Confidential.baseUrl.value,
          ),
        ),
        RepositoryProvider<AuthTokenInterface>(
          create: (context) => AuthTokenRepository(
            prefs: prefs,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsBloc(
              productsApiClient: context.read<ProductsApiClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => ProductDetailBloc(
              productsApiClient: context.read<ProductsApiClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              productsApiClient: context.read<ProductsApiClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => CategoryDetailsBloc(
              productsApiClient: context.read<ProductsApiClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => SearchBloc(
              productsApiClient: context.read<ProductsApiClient>(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              productsApiClient: context.read<ProductsApiClient>(),
              authTokenRepository: context.read<AuthTokenInterface>(),
            )..add(AppStartedEvent()),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: router,
        ),
      ),
    );
  }
}
