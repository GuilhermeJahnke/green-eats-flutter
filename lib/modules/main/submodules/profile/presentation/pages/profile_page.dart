import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../profile_module.dart';
import '../atomic/templates/profile_page_template.dart';
import '../cubits/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';
  static const routePath = ProfileModule.routePath + routeName;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<ProfileCubit>();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.user == null) return const SizedBox.shrink();

        return ProfilePageTemplate(
          onPickImageTap: _cubit.onPickImageTap,
          onUpdateTap: _cubit.onUpdateTap,
          onNameChanged: _cubit.onNameChanged,
          onLastNameChanged: _cubit.onLastNameChanged,
          onEmailChanged: _cubit.onEmailChanged,
          user: state.user!,
        );
      },
    );
  }
}
