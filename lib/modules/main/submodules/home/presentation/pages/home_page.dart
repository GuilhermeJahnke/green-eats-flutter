import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module.dart';
import '../cubits/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';
  static const routePath = HomeModule.routePath + routeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<HomeCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
          ],
        ),
      ),
    );
  }
}
