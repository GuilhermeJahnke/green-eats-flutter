import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../shared/domain/entities/user.dart';
import '../../../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../../../../shared/utils/mixins/interable_mixin.dart';
import '../molecules/pick_user_molecule.dart';
import '../molecules/shimmers/pick_user_shimmer_molecule.dart';

class ProfilePageTemplate extends StatelessWidget {
  const ProfilePageTemplate({
    super.key,
    required this.onPickImageTap,
    required this.onNameChanged,
    required this.onLastNameChanged,
    required this.onEmailChanged,
    required this.onUpdateTap,
    required this.user,
    required this.isLoading,
    required this.isButtonEnabled,
  });

  final VoidCallback onPickImageTap;

  final ValueSetter<String?> onNameChanged;
  final ValueSetter<String?> onLastNameChanged;
  final ValueSetter<String?> onEmailChanged;

  final VoidCallback onUpdateTap;

  final User? user;

  final bool isLoading;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                if (user == null)
                  const PickUserShimmerMolecule()
                else
                  PickUserMolecule(
                    user: user!,
                    onPickImageTap: onPickImageTap,
                  ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      if (user == null) ...[
                        for (var i = 0; i < 4; i++)
                          const TextFieldShimmerMolecule(),
                      ] else ...[
                        TextFieldMolecule(
                          type: TextFieldType.none,
                          label: 'Nome',
                          onChanged: onNameChanged,
                          initialText: user!.name,
                        ),
                        TextFieldMolecule(
                          type: TextFieldType.none,
                          label: 'Sobrenome',
                          onChanged: onLastNameChanged,
                          initialText: user!.lastName,
                        ),
                        TextFieldMolecule(
                          type: TextFieldType.email,
                          label: 'E-mail',
                          onChanged: onEmailChanged,
                          initialText: user!.email,
                        ),
                        TextFieldMolecule(
                          type: TextFieldType.cpf,
                          label: 'CPF',
                          onChanged: (_) {},
                          isEnabled: false,
                          initialText: user!.document,
                        ),
                      ],
                    ].addSeparators(const SizedBox(height: 20.0)),
                  ),
                ),
                if (user == null)
                  SizedBox.fromSize()
                else ...[
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonMolecule(
                      type: Buttontype.filled,
                      isEnabled: isButtonEnabled,
                      isLoading: isLoading,
                      title: 'Salvar',
                      onTap: onUpdateTap,
                    ),
                  ),
                ],
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldShimmerMolecule extends StatelessWidget {
  const TextFieldShimmerMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
