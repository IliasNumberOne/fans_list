import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences preferences;

  PreferenceService(this.preferences);

  static const isFirstEntryKey = 'isFirstEntryKey';

  bool getIsFirstEntry() {
    return preferences.getBool(isFirstEntryKey) ?? false;
  }

  Future<void> setIsFirstEntry() async {
    await preferences.setBool(isFirstEntryKey, true);
  }

}
