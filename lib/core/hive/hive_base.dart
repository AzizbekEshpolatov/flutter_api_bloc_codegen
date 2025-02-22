import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// GetItga register qilinganda,
/// await init() qilib ishga tushurish kerak
class HiveBase {
  late final Box _apiBox;
  late final Box _cacheBox;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}/crm_imv");
    _apiBox = await Hive.openBox("api");
    _cacheBox = await Hive.openBox("cache");
  }

  Box get apiBox => _apiBox;

  Box get cacheBox => _cacheBox;
}
