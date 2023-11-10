import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Utils {
  const Utils._();

  static Widget autoDetectImage(String imagePath) {
    if (imagePath.contains('https')) {
      return Image.network(imagePath);
    }

    if (imagePath.contains('assets') && !imagePath.contains('svg')) {
      return Image.asset(imagePath);
    }

    return SvgPicture.asset(imagePath);
  }

  static ImageProvider autoDetectImageProvider(String imagePath) {
    if (imagePath.contains('http')) {
      return NetworkImage(imagePath);
    } else {
      return AssetImage(imagePath);
    }
  }

  static String formatCurrency(double value) =>
      NumberFormat.simpleCurrency(locale: 'pt-BR').format(value);

  static List<List<T>> groupElements<T>(
    List<T> elements, {
    required int groupSize,
  }) {
    final numberOfGroups = (elements.length % groupSize) == 0
        ? (elements.length / groupSize).floor()
        : (elements.length / groupSize).floor() + 1;

    return List.generate(
      numberOfGroups,
      (i) => elements.skip(i * groupSize).take(groupSize).toList(),
    );
  }

  static String getSaudation() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Bom dia!';
    } else if (hour < 18) {
      return 'Boa tarde!';
    } else {
      return 'Boa noite!';
    }
  }
}
