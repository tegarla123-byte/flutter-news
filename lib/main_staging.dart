import 'package:flutter/cupertino.dart';
import 'package:flutter_news/app.dart';
import 'package:flutter_news/core/config/env_loader.dart';
import 'package:flutter_news/core/config/flavor.dart';
import 'package:flutter_news/core/config/flavor_config.dart';
import 'package:flutter_news/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = Flavor.staging;
  await EnvLoader.load(flavor);
  FlavorConfig(flavor);
  await setupInjector();

  runApp(const NewsApp());
}
