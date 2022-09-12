import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masjit_vendor_app/data/model/masjid.dart';
import 'package:masjit_vendor_app/data/repository/masjid_repository.dart';

class MasjidNotifire extends StateNotifier<AsyncValue<Masjid>> {
  MasjidRepository repository;

  MasjidNotifire(this.repository) : super(const AsyncValue.loading());
}
