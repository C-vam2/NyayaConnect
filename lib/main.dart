import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mini_project_ii/Screens/splashScreen.dart';
import 'package:mini_project_ii/globalVariables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: GlobalVariavles.primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
