import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_colors.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';

class SectionTitleMolecule extends StatelessWidget {
  const SectionTitleMolecule({
    super.key,
    required this.title,
    required this.onSeeMoreTap,
  });

  final String title;
  final VoidCallback onSeeMoreTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeeMoreTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyle.subtitleBold,
            ),
            const Spacer(),
            Text(
              'Ver mais',
              style: AppTextStyle.subtitleRegular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
