import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // final showProfile = prefs.getBool('showProfile') == false;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signOut();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('th'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        // assetLoader: CodegenLoader(),
        child: const MyApp(
          // showProfile: showProfile
          )),
  );
}

class MyApp extends StatelessWidget {
  // final bool showProfile;
  const MyApp({
    Key? key,
    // required this.showProfile,
  }) : super(key: key);

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
      home: AuthService().handleAuthState(),
    );
  }
}
