import 'dart:convert';
import 'charcters_model.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final String apiUrl =
      'https://script.google.com/macros/s/AKfycbyxfhTLZq26xtnYTzv3iUlCY1Ifhz7h72jTiPp53NMY9BUMpodEyq8ASsFnHxnjjIzH/exec';

  Future<List<Character>> getdata() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Character.fromJson(data)).toList();
    } else {
      throw Exception('error');
    }
  }
}
