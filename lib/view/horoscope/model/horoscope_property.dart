import 'package:flutter/foundation.dart';

class HoroscopeProperty {
  static const Horoscope<String> aquarius = Horoscope<String>(key: 'aquarius', name: 'Kova', date: '20 Ocak - 18 Şubat');
  static const Horoscope<String> pisces = Horoscope<String>(key: 'pisces', name: 'Balık', date: '19 Şubat - 20 Mart');
  static const Horoscope<String> aries = Horoscope<String>(key: 'aries', name: 'Koç', date: '21 Mart - 19 Nisan');
  static const Horoscope<String> taurus = Horoscope<String>(key: 'taurus', name: 'Boğa', date: '20 Nisan - 20 Mayıs');
  static const Horoscope<String> gemini = Horoscope<String>(key: 'gemini', name: 'İkizler', date: '21 Mayıs - 20 Haziran');
  static const Horoscope<String> cancer = Horoscope<String>(key: 'cancer', name: 'Yengeç', date: '21 Haziran - 22 Temmuz');
  static const Horoscope<String> leo = Horoscope<String>(key: 'leo', name: 'Aslan', date: '23 Temmuz - 22 Ağustos');
  static const Horoscope<String> virgo = Horoscope<String>(key: 'virgo', name: 'Başak', date: '23 Ağustos - 22 Eylül');
  static const Horoscope<String> libra = Horoscope<String>(key: 'libra', name: 'Terazi', date: '23 Eylül - 22 Ekim');
  static const Horoscope<String> scorpio = Horoscope<String>(key: 'scorpio', name: 'Akrep', date: '23 Ekim - 21 Kasım');
  static const Horoscope<String> sagittarius = Horoscope<String>(key: 'sagittarius', name: 'Yay', date: '22 Kasım - 21 Aralık');
  static const Horoscope<String> capricorn = Horoscope<String>(key: 'capricorn', name: 'Oğlak', date: '22 Aralık - 19 Ocak');

  static const List<Horoscope<String>> horoscopeList = [aquarius, pisces, aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn];
}

class Horoscope<T> with Diagnosticable {
  final String key;
  final String name;
  final String date;

  const Horoscope({
    required this.key,
    required this.name,
    required this.date,
  });
}
