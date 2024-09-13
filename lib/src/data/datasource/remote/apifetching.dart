import 'package:bloc_task/src/domain/model/datamodel.dart';
import 'package:bloc_task/src/utils/constants/apibaseurl.dart';
import 'package:dio/dio.dart';

class SuperheroRepository {
  Future<List<Superhero>> fetchSuperheroes() async {
    final dio = Dio();
    final response = await dio.get(Apibaseurl.api);

    final Map<String, dynamic> jsonResponse =
        response.data as Map<String, dynamic>;
    final List<dynamic>? data = jsonResponse['superheros'] as List<dynamic>?;
    return data!.map((json) => Superhero.fromJson(json)).toList();
  }
}
