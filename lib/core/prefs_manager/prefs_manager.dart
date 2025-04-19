import 'package:islami_app_c14_online_sat/core/resources/constant_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  /// 1   4
  static void addSuraIndex(int suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    if (mostRecentSurasIndex.contains("$suraIndex")) {
      mostRecentSurasIndex.remove("$suraIndex");
      mostRecentSurasIndex.add("$suraIndex");
    } else {
      mostRecentSurasIndex.add("$suraIndex");
    }

    prefs.setStringList("most_recent_suras_index", mostRecentSurasIndex);

    print(mostRecentSurasIndex.length);
  }

  static Future<List<SuraDM>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList("most_recent_suras_index") ?? [];
    ["1", "3", "5"];
    List<SuraDM> mostRecentSuras = [];

    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int suraIndex = int.parse(mostRecentSurasIndex[i]);
      mostRecentSuras.add(ConstantManager.suras[suraIndex]);
    }

    return mostRecentSuras.reversed.toList();
  }
}
