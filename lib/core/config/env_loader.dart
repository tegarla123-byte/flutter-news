import 'package:flutter_news/core/config/flavor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static Future<void> load(Flavor flavor) async {
    switch (flavor) {
      case Flavor.staging:
        await dotenv.load(fileName: 'assets/env/.env.staging');
        break;
      case Flavor.prod:
        await dotenv.load(fileName: 'assets/env/.env.prod');
        break;
      case Flavor.dev:
        await dotenv.load(fileName: 'assets/env/.env.dev');
        break;
    }
  }
}
