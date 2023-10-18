class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get horoscopeSign => toJpg('horoscope_sign');

  String toPng(String name) => 'assets/image/$name.png';
  String toJpg(String name) => 'assets/image/$name.jpg';
}
