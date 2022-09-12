import 'package:dio/dio.dart';
import 'package:masjit_vendor_app/data/dio_client.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';

class MasjidRepository {
  final DioClient client;

  MasjidRepository(this.client);

  Future<Response<Masjid>> register(FormData data) {
    return client.register(data);
  }

  Future<Response<Masjid>> update(String id, FormData data) {
    return client.update(id, data);
  }

  Future<Response<dynamic>> logout() {
    return client.logout();
  }
}
