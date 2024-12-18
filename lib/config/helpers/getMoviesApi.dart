import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_test/config/config.dart';
import 'package:movies_test/domain/domain.dart';
import 'package:movies_test/domain/entities/movie.entity.dart';

class MoviesApi {

   late Dio _dio;

  MoviesApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _getBaseUrl(),
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20), 
      ),
    );
  }

  String _getBaseUrl() {
    if (kIsWeb) {
      return Envaironment.apiUrl; 
    }

    if (Platform.isAndroid) {
      return Envaironment.apiUrl;
    } else if (Platform.isIOS) {
      return Envaironment.apiUrl;
    } else {
      throw Exception('Plastform is not supported');
    }
  }

  Future<List<Movie>> getMovies() async {
    final response = await _dio.get(
    '/movie/now_playing',
     options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGI1MDRjYjE0MDg1ODcxNTQ0ZGRkZTg4ODY2MDZhNSIsIm5iZiI6MTczMTI0MzI1MC4xNTQ4OTg0LCJzdWIiOiI2NzMwYWJkNTQ1Yjg3MDIzMTk2MmNhZTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.QjaDZ6PULLqYvGtbiYaZ-u0PnBCTbvZwXonzzkbCqZ4', // Aquí agregas el token en los headers
          },
        ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];
      return data
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
    } else {
      throw Exception('Error to get movies of this getMovie');
    }
  }

  Future<List<Movie>> getMoviesTop() async {
    final response = await _dio.get(
    '/movie/top_rated',
     options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGI1MDRjYjE0MDg1ODcxNTQ0ZGRkZTg4ODY2MDZhNSIsIm5iZiI6MTczMTI0MzI1MC4xNTQ4OTg0LCJzdWIiOiI2NzMwYWJkNTQ1Yjg3MDIzMTk2MmNhZTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.QjaDZ6PULLqYvGtbiYaZ-u0PnBCTbvZwXonzzkbCqZ4', // Aquí agregas el token en los headers
          },
        ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['results'];

      return data
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
    } else {
      throw Exception('Error to get movies of this getMovieTop');
    }
  }

Future<List<Credits>> getCredit( int movieId ) async {

    final response = await _dio.get(
      '/movie/$movieId/credits',
      options: Options(
          headers: {
          'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGI1MDRjYjE0MDg1ODcxNTQ0ZGRkZTg4ODY2MDZhNSIsIm5iZiI6MTczMTI0MzI1MC4xNTQ4OTg0LCJzdWIiOiI2NzMwYWJkNTQ1Yjg3MDIzMTk2MmNhZTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.QjaDZ6PULLqYvGtbiYaZ-u0PnBCTbvZwXonzzkbCqZ4'
          },
        ),
    );
    if (response.statusCode == 200) {
       final List<dynamic> data = response.data['cast'];
      print(data);
      return data
          .map((CreditJson) => Credits.fromJson(CreditJson))
          .toList();
    } else {
      throw Exception('Error to get movies of this getCredit');
    }
  }

  Future<Map<String, dynamic>> getDetails( int movieId ) async {

    final response = await _dio.get(
      '/movie/$movieId',
      options: Options(
          headers: {
          'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGI1MDRjYjE0MDg1ODcxNTQ0ZGRkZTg4ODY2MDZhNSIsIm5iZiI6MTczMTI0MzI1MC4xNTQ4OTg0LCJzdWIiOiI2NzMwYWJkNTQ1Yjg3MDIzMTk2MmNhZTAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.QjaDZ6PULLqYvGtbiYaZ-u0PnBCTbvZwXonzzkbCqZ4'
          },
        ),
    );
    if (response.statusCode == 200) {
       final data = response.data;
      return data;
    } else {
      throw Exception('Error to get movies of this getDetails');
    }
  }

}