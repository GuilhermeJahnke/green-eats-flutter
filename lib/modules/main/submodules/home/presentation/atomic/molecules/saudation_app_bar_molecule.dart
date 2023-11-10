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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 205, 211, 207),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.person,
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
