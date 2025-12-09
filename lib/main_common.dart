import 'package:flutter/material.dart';
import 'package:lab14/config/app_config.dart';

void runMainApp() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = AppConfig.appName;

    return MaterialApp(
      title: appName,
      home: Scaffold(
        appBar: AppBar(title: Text(appName)),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Environment: ${AppConfig.environment.name}'),
              Text('API: ${AppConfig.apiBaseUrl}'),
              Text('Production: ${AppConfig.isProduction}'),
            ],
          ),
        ),
      ),
    );
  }
}
