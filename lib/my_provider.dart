import 'package:flutter/material.dart';

class MyPromptProvider extends ChangeNotifier {
  String _prompt = '';
  String get prompt => _prompt;

  void getPrompt(String prompt) {
    _prompt = prompt;
    notifyListeners();
  }
}
