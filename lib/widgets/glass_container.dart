import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double blur;
  final double opacity;
  final BorderRadius borderRadius;
  final Widget? child;
  final Color color;
  final List<BoxShadow>? shadow;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double borderWidth;
  final bool useGradient;

  const GlassContainer({
    Key? key,
    this.blur = 15.0,
    this.opacity = 0.5,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.child,
    this.color = Colors.white,
    this.shadow,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth = 1.5,
    this.useGradient = true, // <-- default on
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = useGradient
        ? BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: borderRadius,
      boxShadow: shadow ??
          [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
      border: Border.all(
        color: borderColor ?? Colors.white.withOpacity(0.2),
        width: borderWidth,
      ),
    )
        : BoxDecoration(
      color: color.withOpacity(opacity),
      borderRadius: borderRadius,
      boxShadow: shadow ??
          [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
      border: Border.all(
        color: borderColor ?? Colors.white.withOpacity(0.2),
        width: borderWidth,
      ),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          height: height,
          width: width,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
