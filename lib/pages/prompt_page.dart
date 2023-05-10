import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_condense/my_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({super.key});

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyPromptProvider state = Provider.of<MyPromptProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  'Put your prompt here:',
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                  speed: const Duration(
                    milliseconds: 175,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _promptController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  borderSide: BorderSide(width: 3),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  borderSide: BorderSide(color: Colors.lightGreen, width: 3),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _promptController.clear();
                  },
                  child: const Icon(
                    Icons.delete_outline,
                  ),
                ),
                helperText: '*maximum length is about 2000 characters',
              ),
              onChanged: (e) {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.lightGreen,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 55,
                    right: 55,
                  ),
                  child: const Text(
                    'Get the result',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 26),
                  ),
                ),
                onPressed: () {
                  state.getPrompt(_promptController.text);
                  Navigator.pushNamed(
                    context,
                    '/response',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
