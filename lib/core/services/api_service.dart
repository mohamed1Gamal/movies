import 'package:dio/dio.dart';

class ApiService {

  static Dio dio = Dio(
    BaseOptions(baseUrl: "https://movies-api.accel.li/api/v2/"),
  );
}