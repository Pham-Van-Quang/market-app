import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'package:device_preview/device_preview.dart';

import 'log_in.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
                builder: (context) => const LogIn(title: "On Generated Route"),
                settings: settings);
          case "/home_page":
            return MaterialPageRoute(
                builder: (context) =>
                    HomePage(args: settings.arguments as ScreenArgument?),
                settings: settings);
        }
        return null;
      },
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SVN-Avo',
        primarySwatch: Colors.blue,
      ),
    );
  }
}
