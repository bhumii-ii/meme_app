import 'dart:convert';

import 'package:http/http.dart';
class FetchMeme
{
  fetchNewMeme()
  async {
    Response response=  await get(Uri.parse("https://meme-api.com/gimme"));
    print(response.body);
    Map json_response= jsonDecode(response.body);
    print(json_response['url']);
    return json_response['url'];
  }

}
