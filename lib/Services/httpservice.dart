import 'dart:convert';

import 'package:api_with_provider/Model/postmodel.dart';
import 'package:http/http.dart' as http;

class HTTPService{
  Future<Post> postsData(String title, String subTitle)async{
    var body = {
      'title': title,
      'body': subTitle,
      'userId': 1
    };
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-type': 'application/json; charset=UTF-8',},
      body: json.encode(body)
    );
    var decodedData = jsonDecode(response.body);
    print(response.body);
    return Post.fromJson(decodedData);
  }
}