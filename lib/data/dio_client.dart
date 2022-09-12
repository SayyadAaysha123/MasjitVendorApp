import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';

class DioClient {
  late Dio _client;
  final options = BaseOptions(
    baseUrl: 'http://masjid.exportica.in/api',
    validateStatus: (status) => (status! >= 200 && status < 300),
  );

  DioClient() {
    _client = Dio(options);
    _client.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response<Masjid>> register(FormData data) {
    Future<Response<Masjid>> response =
        _client.post('/masjid/register', data: data);
    log(response.toString());
    return response;
  }

  Future<Response<Masjid>> update(String id, FormData data) {
    return _client.post('/masjids/$id', data: data);
  }

  Future<Response<dynamic>> logout() {
    return _client.get('/logout');
  }
}
