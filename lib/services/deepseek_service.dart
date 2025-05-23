import 'dart:convert';

import 'package:http/http.dart' as http;

Stream<String> sendMessageToBotStream(
    String userMessage, String locale) async* {
  String systemPrompt;

  switch (locale) {
    case 'ky':
      systemPrompt = "Сен кыргызча сүйлөшүүгө тийишсиң.";
      break;
    case 'ru':
      systemPrompt = "Ты должен говорить только на русском языке.";
      break;
    case 'en':
    default:
      systemPrompt = "You must speak only in English.";
  }

  final request = {
    "model": "deepseek-chat",
    "stream": true,
    "messages": [
      {"role": "system", "content": systemPrompt},
      {"role": "user", "content": userMessage}
    ]
  };

  final response = await http.Client().send(
    http.Request(
      'POST',
      Uri.parse('https://api.deepseek.com/v1/chat/completions'),
    )
      ..headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer sk-2cfc54ff878f4866a2ac6b981a0b21bb',
      })
      ..body = jsonEncode(request),
  );

  final lines =
      response.stream.transform(utf8.decoder).transform(const LineSplitter());

  await for (final line in lines) {
    if (line.trim().isEmpty) continue;
    if (line.trim() == 'data: [DONE]') break;

    if (line.startsWith('data:')) {
      final jsonPart = line.replaceFirst('data: ', '');
      try {
        final Map<String, dynamic> chunk = jsonDecode(jsonPart);
        final String? content = chunk['choices'][0]['delta']?['content'];
        if (content != null) {
          yield cleanMarkdown(content);
        }
      } catch (e) {
        yield '[Parsing error: $e]';
      }
    }
  }
}

String cleanMarkdown(String text) {
  final regex = RegExp(r'(\*\*|\*|__|_|~|`|#|---|\||\(|\))+');
  return text.replaceAll(regex, '');
}
