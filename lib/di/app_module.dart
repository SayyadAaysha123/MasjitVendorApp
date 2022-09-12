import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masjit_vendor_app/data/dio_client.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/repository/masjid_repository.dart';
import 'package:masjit_vendor_app/screens/masjid_notifier.dart';

final dioClientProvider = Provider((ref) => DioClient());

final repositoryProvider = Provider((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return MasjidRepository(dioClient);
});

final masjidNotifireProvider =
    StateNotifierProvider<MasjidNotifire, AsyncValue<Masjid>>((ref) {
  final repository = ref.watch(repositoryProvider);
  return MasjidNotifire(repository);
});
