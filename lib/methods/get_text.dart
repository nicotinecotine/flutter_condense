import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

Future<String> getTextFromGPT(String prompt) async {
  String responseString = '';
  const String basedPrompt =
      'Bring me an abbreviated version of this text in the original language, pay attention to the important: ';
  final openAI = OpenAI.instance.build(
    token: 'API_KEY',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 60)),
    isLog: true,
  );

  final request = ChatCompleteText(
    messages: [
      Map.of({"role": "user", "content": basedPrompt + prompt})
    ],
    maxToken: 1900,
    model: ChatModel.gptTurbo,
  );

  final response = await openAI.onChatCompletion(request: request);

  for (var element in response!.choices) {
    responseString += element.message!.content;
  }

  return responseString;
}
