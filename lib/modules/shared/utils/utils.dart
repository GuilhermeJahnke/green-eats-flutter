import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Utils {
  const Utils._();

  static Widget autoDetectImage(String imagePath, {BoxFit? fit}) {
    if (imagePath.contains('https')) {
      return Image.network(
        imagePath,
        fit: fit,
      );
    }

    if (imagePath.contains('assets') && !imagePath.contains('svg')) {
      return Image.asset(
        imagePath,
        fit: fit,
      );
    }

    return SvgPicture.asset(
      imagePath,
      fit: fit ?? BoxFit.contain,
    );
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

  static String formatWeight(double weight) {
    if (weight < 1) {
      return '${(weight * 1000).toInt()}g';
    } else {
      return '${weight.toInt()}kg';
    }
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy - HH:mm');
    return formatter.format(date);
  }
}
