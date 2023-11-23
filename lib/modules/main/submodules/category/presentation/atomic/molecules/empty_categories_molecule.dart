import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_assets.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';

class EmptyCategoriesMolecule extends StatelessWidget {
  const EmptyCategoriesMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.emptyCategories),
        const SizedBox(height: 20.0),
        const Text(
          'Nenhuma categoria encontrada',
          style: AppTextStyle.titleBold,
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Tente novamente mais tarde!',
          style: AppTextStyle.subtitleRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
