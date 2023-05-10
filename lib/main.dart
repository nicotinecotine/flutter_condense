import 'package:flutter/material.dart';
import 'package:flutter_condense/my_provider.dart';
import 'package:flutter_condense/pages/prompt_page.dart';
import 'package:flutter_condense/pages/welcome_page.dart';
import 'package:flutter_condense/pages/response_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyPromptProvider>.value(
          value: MyPromptProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Condense',
        home: const Scaffold(
          body: WelcomePage(),
        ),
        theme: ThemeData.dark(),
        routes: {
          '/welcome': (context) => const WelcomePage(),
          '/prompt': (context) => const PromptPage(),
          '/response': (context) => const ResponsePage(),
        },
      ),
    );
  }
}
