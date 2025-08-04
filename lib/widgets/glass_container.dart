import 'dart:ui';
import 'package:flutter/material.dart';

/// A customizable frosted glass UI container for Flutter apps.
///
/// The [GlassContainer] widget provides a modern glassmorphism effect
/// using blur, opacity, border, and optional gradients.
///
/// Example usage:
/// ```dart
/// GlassContainer(
///   blur: 20,
///   opacity: 0.3,
///   height: 200,
///   width: 300,
///   borderRadius: BorderRadius.circular(20),
///   child: Text("Glassmorphic UI"),
/// )
/// ```
class GlassContainer extends StatelessWidget {
  /// The amount of blur applied to the background.
  ///
  /// Default is `15.0`.
  final double blur;

  /// The opacity level of the background color.
  ///
  /// Default is `0.5`. Ignored if [useGradient] is `true`.
  final double opacity;

  /// The border radius of the container.
  ///
  /// Default is `BorderRadius.circular(20)`.
  final BorderRadius borderRadius;

  /// The widget to be displayed inside the glass container.
  final Widget? child;

  /// The solid background color used when [useGradient] is `false`.
  ///
  /// Default is `Colors.white`.
  final Color color;

  /// A list of shadows to apply around the container.
  ///
  /// If null, a default soft shadow is applied.
  final List<BoxShadow>? shadow;

  /// The height of the container.
  final double? height;

  /// The width of the container.
  final double? width;

  /// The color of the border around the glass container.
  ///
  /// Default is semi-transparent white if null.
  final Color? borderColor;

  /// The width of the border.
  ///
  /// Default is `1.5`.
  final double borderWidth;

  /// Whether to use a built-in gradient for background.
  ///
  /// If `false`, a solid [color] is used instead.
  ///
  /// Default is `true`.
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
    this.useGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration = useGradient
        ? BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white.withAlpha((0.25 * 255).toInt()),
          Colors.white.withAlpha((0.05 * 255).toInt()),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: borderRadius,
      boxShadow: shadow ??
          [
            BoxShadow(
              color: Colors.black.withAlpha((0.1 * 255).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
      border: Border.all(
        color: (borderColor ?? Colors.white)
            .withAlpha((0.2 * 255).toInt()),
        width: borderWidth,
      ),
    )
        : BoxDecoration(
      color: color.withAlpha((opacity * 255).toInt()),
      borderRadius: borderRadius,
      boxShadow: shadow ??
          [
            BoxShadow(
              color: Colors.black.withAlpha((0.1 * 255).toInt()),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
      border: Border.all(
        color: (borderColor ?? Colors.white)
            .withAlpha((0.2 * 255).toInt()),
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
