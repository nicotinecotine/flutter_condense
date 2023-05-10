import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Condense',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          const Text(
            'Features',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 2500),
            animatedTexts: [
              TyperAnimatedText(
                'Highlight summary',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
              TyperAnimatedText(
                'Reduce the amount of text',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
              TyperAnimatedText(
                'Highlight important',
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 65,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 50, right: 50),
                child: const Text(
                  'Get started',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 26),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/prompt',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
