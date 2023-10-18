import 'dart:convert';

HoroscopeModel? horoscopeFromJson(String str) => HoroscopeModel.fromJson(json.decode(str));

String horoscopeToJson(HoroscopeModel? data) => json.encode(data!.toJson());

List<HoroscopeModel> horoscopeListFromJson(String str) => List<HoroscopeModel>.from(json.decode(str).map((x) => HoroscopeModel.fromJson(x)));

String horoscopeListToJson(List<HoroscopeModel?> data) => json.encode(List<dynamic>.from(data.map((x) => x!.toJson())));

class HoroscopeModel {
  HoroscopeModel({
    this.color,
    this.compatibility,
    this.date,
    this.day,
    this.dislikes,
    this.element,
    this.flower,
    this.gem,
    this.house,
    this.key,
    this.likes,
    this.numbers,
    this.planet,
    this.quality,
    this.strengths,
    this.weaknesses,
  });

  String? color;
  String? compatibility;
  String? date;
  String? day;
  String? dislikes;
  String? element;
  String? flower;
  String? gem;
  String? house;
  String? key;
  String? likes;
  String? numbers;
  String? planet;
  String? quality;
  String? strengths;
  String? weaknesses;

  @override
  String toString() {
    return 'Horoscope {color: $color, compatibility: $compatibility, date: $date, day: $day, dislikes: $dislikes, element: $element, flower: $flower, gem: $gem, house: $house, key: $key, likes: $likes, numbers: $numbers, planet: $planet, quality: $quality, strengths: $strengths, weaknesses: $weaknesses, }';
  }

  factory HoroscopeModel.fromJson(Map<String, dynamic> json) => HoroscopeModel(
        color: json["color"],
        compatibility: json["compatibility"],
        date: json["date"],
        day: json["day"],
        dislikes: json["dislikes"],
        element: json["element"],
        flower: json["flower"],
        gem: json["gem"],
        house: json["house"],
        key: json["key"],
        likes: json["likes"],
        numbers: json["numbers"],
        planet: json["planet"],
        quality: json["quality"],
        strengths: json["strengths"],
        weaknesses: json["weaknesses"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "compatibility": compatibility,
        "date": date,
        "day": day,
        "dislikes": dislikes,
        "element": element,
        "flower": flower,
        "gem": gem,
        "house": house,
        "key": key,
        "likes": likes,
        "numbers": numbers,
        "planet": planet,
        "quality": quality,
        "strengths": strengths,
        "weaknesses": weaknesses,
      };
}
