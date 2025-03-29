import 'dart:convert';

import 'package:deepseek/deepseek.dart';

final DeepSeek deepSeek = DeepSeek("sk-2cfc54ff878f4866a2ac6b981a0b21bb");

Future<String> sendMessageToBot(String userMessage) async {
  try {
    Completion response = await deepSeek.createChat(
      messages: [Message(role: "user", content: userMessage)],
      model: Models.chat.name,
      options: {
        "temperature": 1.0,
        "max_tokens": 4096,
      },
    );

    return utf8.decode(response.text.runes.toList());
  } catch (e) {
    throw "Ошибка при получении ответа от бота: $e";
  }
}
