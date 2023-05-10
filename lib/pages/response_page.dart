import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_condense/my_provider.dart';
import 'package:flutter_condense/methods/get_text.dart';

class ResponsePage extends StatelessWidget {
  const ResponsePage({super.key});
  @override
  Widget build(BuildContext context) {
    MyPromptProvider state = Provider.of<MyPromptProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Сondensed text:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(left: 2, top: 2),
                child: FutureBuilder<String>(
                  future: getTextFromGPT(state.prompt),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            snapshot.data!,
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            speed: const Duration(milliseconds: 20),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator(
                      color: Colors.lightGreen,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
