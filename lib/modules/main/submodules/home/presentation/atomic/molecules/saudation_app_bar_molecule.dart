import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/utils/utils.dart';

class SaudationAppBarMolecule extends StatelessWidget {
  const SaudationAppBarMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Utils.autoDetectImage(
              'https://img.myloview.com/stickers/default-avatar-profile-icon-vector-social-media-user-700-202768327.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Utils.getSaudation(),
              style: AppTextStyle.subtitleRegular,
            ),
            const SizedBox(height: 8),
            const Text(
              'Amélia Barlow',
              style: AppTextStyle.subtitleRegular,
            ),
          ],
        ),
      ],
    );
  }
}
