import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

import '../helper/global.dart';

class APIs {
  //get answer from chat gpt
  static Future<void> getAnswer(String question) async {
    //
    final res =
        await post(Uri.parse('https://api.openai.com/v1/chat/completions'),

            //headers
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer $apiKey'
            },

            //body
            body: jsonEncode({
              "model": "gpt-3.5-turbo",
              "max_tokens": 2000,
              "temperature": 0,
              "messages": [
                {"role": "user", "content": question},
              ]
            }));

    final data = jsonDecode(res.body);

    log('res: ${data['choices'][0]['message']['content']}');
  }
}
