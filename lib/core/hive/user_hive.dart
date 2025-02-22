import 'hive_base.dart';

class UserHive {
  final HiveBase _base;

  const UserHive(this._base);

  bool firstTime() => _base.cacheBox.get("first_time", defaultValue: true);

  Future<void> setFirstTime() async =>
      await _base.cacheBox.put("first_time", true);
}
