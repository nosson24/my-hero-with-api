import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/page/home_tab/view/profile_page.dart';
import 'package:test_project/page/introduction_screen/view/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = await SharedPreferences.getInstance();
  final showProfile = prefs.getBool('showProfile') ?? false;

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('th'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        // assetLoader: CodegenLoader(),
        child: MyApp(showProfile: showProfile)),
  );
}

class MyApp extends StatelessWidget {
  final bool showProfile;

  const MyApp({Key? key, required this.showProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: showProfile ? const ProfilePage() : const IntroScreen(),
    );
  }
}
