import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 5), // Tiempo de espera para la conexión
      receiveTimeout: Duration(
        seconds: 5,
      ), // Tiempo de espera para la recepción de datos
    ),
  );

  Future<List<dynamic>> getPosts() async {
    try {
      final response = await _dio.get('/posts');
      return response.data;
    } on DioError catch (e) {
      print("Error: ${e.message}");
      return [];
    }
  }
}
