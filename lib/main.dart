import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      tools: const [
        DeviceSection(),
      ],
      builder: (context) {
        final platform = Theme.of(context).platform;
        if (platform == TargetPlatform.iOS) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            locale: DevicePreview.locale(context),
            title: 'A Cupertino app',
            theme: const CupertinoThemeData(
              primaryColor: Colors.green,
            ),
            home: CupertinoPageScaffold(
              child: Center(
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'A CupertinoButton',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            locale: DevicePreview.locale(context),
            title: 'A Material app',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'A Material TextButton',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
