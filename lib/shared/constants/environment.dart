import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

sealed class Environment {
  static String get baseUrl => dotenv.env['API_BASE_URL']!;
  static String get fileName => kReleaseMode ? ".env.production" : ".env.development";
}
