import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  static Future<String> ask(String message) async {

    final response = await http.post(

      Uri.parse('http://127.0.0.1:11434/api/generate'),

      headers: {
        'Content-Type': 'application/json',
      },

      body: jsonEncode({

        "model": "llama3.2",

        "prompt":
            """You are Alex.

You are a warm, funny, caring friend.

Keep answers under 3 sentences.

User: $message

Alex:""",

        "stream": false

      }),

    );


    if (response.statusCode != 200) {
      throw Exception(
          'HTTP ${response.statusCode}\n${response.body}');
    }

    final data = jsonDecode(response.body);

    return data["response"] ?? "No response";

  }

}
