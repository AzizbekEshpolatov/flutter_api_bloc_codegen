import 'hive_base.dart';

class ApiHive {
  final HiveBase _base;

  const ApiHive(this._base);

  String get(String key) => _base.apiBox.get(key, defaultValue: "");

  Future<void> put(String key, String value) => _base.apiBox.put(key, value);

  // TokenModel get token {
  //   final json = jsonDecode(_base.apiBox.get("token", defaultValue: "{}"));
  //   return TokenModel.fromJson(json);
  // }

  String get refreshToken {
    final refresh = _base.apiBox.get("refresh_token", defaultValue: "");
    return refresh;
  }

  String get getDeviceId {
    final deviceId = _base.apiBox.get("device_id", defaultValue: "");
    return deviceId;
  }

  String get accessToken {
    final access = _base.apiBox.get("access_token", defaultValue: "");
    return access;
  }
  //
  // Future<void> putToken(TokenModel value) async {
  //   await _base.apiBox.put("refresh_token", value.refresh);
  //   await _base.apiBox.put("access_token", value.access);
  // }

  Future<void> refresh(String access) async {
    await _base.apiBox.put("access_token", access);
  }

  Future<void> putDeviceId(String deviceId) async {
    await _base.apiBox.put("device_id", deviceId);
  }

  Future<void> clear() => _base.apiBox.clear();
}

