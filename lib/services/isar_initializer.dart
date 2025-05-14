import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/models/message_model.dart';

class IsarInitializer extends AsyncNotifier<Isar> {
  late Isar _isar;

  @override
  Future<Isar> build() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [MessageModelSchema],
      inspector: true,
      directory: dir.path,
    );

    // リソース解放処理を登録
    ref.onDispose(() {
      _isar.close();
    });

    return _isar;
  }
}