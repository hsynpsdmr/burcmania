import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/enum/preferences_keys_enum.dart';
import '../../../core/init/memory/preferences_manager.dart';
import '../../../service/firebase_service.dart';
import '../model/horoscope_model.dart';

class HoroscopeService extends FirebaseService {
  Future<HoroscopeModel?> getHoroscope(String hero) async {
    try {
      var userData = await firebaseFirestore.collection("horoscope").doc(hero).get();
      return HoroscopeModel.fromJson(userData.data()!);
    } catch (e) {
      if (e is PlatformException) {
        return null;
      }
      return null;
    }
  }

  Future<List<HoroscopeModel>?> getAllHoroscope() async {
    try {
      CollectionReference horo = firebaseFirestore.collection("horoscope");
      QuerySnapshot querySnapshot = await horo.get();
      List<HoroscopeModel>? hml = querySnapshot.docs.map((doc) => HoroscopeModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
      PreferencesManager.instance.setStringVal(PreferencesKeys.getAllHoroscope, horoscopeListToJson(hml));
      return hml;
    } catch (e) {
      if (e is PlatformException) {
        return null;
      }
      return null;
    }
  }

  HoroscopeModel? getHoroscopeByKey(String key) {
    List<HoroscopeModel> hml = horoscopeListFromJson(PreferencesManager.instance.getStringVal(PreferencesKeys.getAllHoroscope));
    return hml.singleWhere((horo) => horo.key == key);
  }
}
