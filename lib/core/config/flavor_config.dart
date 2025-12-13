import 'package:flutter_news/core/config/flavor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FlavorConfig {
  final Flavor flavor;
  final String appName;
  final String newsApiBaseUrl;
  final String newsApiKey;

  static late FlavorConfig instance;

  FlavorConfig(this.flavor)
    : appName = dotenv.env['APP_NAME']!,
      newsApiBaseUrl = dotenv.env['NEWS_API_BASE_URL']!,
      newsApiKey = dotenv.env['NEWS_API_KEY']! {
    instance = this;
  }
}
