import 'package:flutter/material.dart';
import 'package:glossy_morphism/widgets/glass_container.dart';

class GlassEffect extends StatefulWidget {
  const GlassEffect({super.key});

  @override
  State<GlassEffect> createState() => _GlassEffectState();
}

class _GlassEffectState extends State<GlassEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Local asset background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glass effect container
          Center(
              child:
              GlassContainer(
                useGradient: true,
                height: 200,
                width: 300,
                blur: 5,
                opacity: 0.4,
                borderRadius: BorderRadius.circular(25),
                borderColor: Colors.blueAccent.withOpacity(0.3),
                borderWidth: 2.0,
                shadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 15,
                    offset: Offset(0, 6),
                  ),
                ],
                child: Center(
                  child: Text(
                    'Custom Glass UI',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )

          ),
        ],
      ),
    );
  }
}

