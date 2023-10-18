class JsonConstants {
  static JsonConstants? _instace;

  static JsonConstants get instance => _instace ??= JsonConstants._init();

  JsonConstants._init();

  String get splash => toPng('splash');
  String toPng(String name) => 'assets/json/$name.json';
}
