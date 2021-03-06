import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marvel_app/Models/movie_model.dart';

class ApiService {


  static Future<List<MovieData>> getMarvelData() async {
    String api = 'https://mcuapi.herokuapp.com/api/v1/movies';
    Uri apiUri = Uri.parse(api);
    var response = await http.get(apiUri);
    var body = response.body;
    var decodedObject = jsonDecode(body);
    return MovieModel.fromJson(decodedObject).data!;
  }
}
