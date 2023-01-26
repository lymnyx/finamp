import 'package:flutter/material.dart';

const _threshold = 0.1;

extension AtContrast on Color {
// Contrast calculations
  double contrastRatio(num a, num b) {
    final ratio = (a + 0.05) / (b + 0.05);
    return ratio >= 1 ? ratio : 1 / ratio;
  }

  double _inc(double lightness, bool lighter) {
    final max = lighter ? 1 : 0;

    return (max - lightness) / 2;
  }

  Color atContrast(double targetContrast, Color background, bool lighter) {
    int iters = 0;
    final inc = lighter ? 0.01 : -0.01;

    HSLColor hslColor = HSLColor.fromColor(this);

    final backgroundLuminance = background.computeLuminance();

    double diff = 0.0;
    while ((diff = contrastRatio(hslColor.toColor().computeLuminance(),
                    backgroundLuminance) -
                targetContrast)
            .abs() >
        _threshold) {
      iters++;
      final newLightness = _inc(hslColor.lightness, diff.isNegative);

      if (newLightness < 0 || newLightness > 1) break;

      hslColor = hslColor.withLightness(hslColor.lightness + newLightness);
    }

    print("$iters iters");

    return hslColor.toColor();
  }
}
