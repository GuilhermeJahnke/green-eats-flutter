import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../authentication_module.dart';
import '../atomic/templates/register_page_template.dart';
import '../cubits/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';
  static const routePath = AuthenticationModule.moduleName + routeName;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final cubit = Modular.get<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      bloc: cubit,
      builder: (context, state) {
        return RegisterPageTemplate(
          onNameChanged: cubit.onNameChanged,
          onLastNameChanged: cubit.onLastNameChanged,
          onCpfChanged: cubit.onCpfChanged,
          onEmailChanged: cubit.onEmailChanged,
          onPasswordChanged: cubit.onPasswordChanged,
          onConfirmPasswordChanged: cubit.onConfirmPasswordChanged,
          onRegisterTap: cubit.onRegisterTap,
          onTermsAndConditionsTap: cubit.onTermsAndConditionsTap,
        );
      },
    );
  }
}
