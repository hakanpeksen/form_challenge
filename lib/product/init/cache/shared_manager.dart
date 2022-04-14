import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { currentTheme }

abstract class ISharedManager {
  bool? getBoolValue(SharedKeys keys);
  Future<bool> saveTheme(SharedKeys keys, bool value);
}

class SharedManager implements ISharedManager {
  static SharedManager? _instace;
  late SharedPreferences _preferences;

  static SharedManager get instace => _instace ??= SharedManager._();

  SharedManager._();

  static Future<void> initSharedPrefences() async {
    instace._preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveTheme(SharedKeys keys, bool value) async {
    return await _preferences.setBool(keys.name, value);
  }

  @override
  bool? getBoolValue(SharedKeys keys) {
    return _preferences.getBool(keys.name);
  }
}
