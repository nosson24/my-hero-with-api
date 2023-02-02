import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/page/setting_tab/widget/commandMenu.dart';
import 'package:test_project/page/setting_tab/widget/history.dart';
import 'package:test_project/page/setting_tab/widget/profile.dart';
import 'package:test_project/page/setting_tab/widget/set_language.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/translations/locale_keys.g.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.page_settingTab_setTing.tr()),
          backgroundColor: MainAppColor.topBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const ListProFile(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CommandMenu(
                      prefixText: Text(
                        LocaleKeys.page_settingTab_setTing.tr(),
                      ),
                      suffixWidget: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => const SetLanguagePage()))
                            .then((value) {
                          setState(() {});
                        });
                      },
                    ),
                    CommandMenu(
                      prefixText: const Text('History'),
                      suffixWidget: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HistoryTab()));
                      },
                    ),
                    CommandMenu(
                      prefixText: Text(
                        LocaleKeys.page_settingTab_logOut.tr(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      suffixWidget: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () async {
                        // final prefs = await SharedPreferences.getInstance();
                        // prefs.setBool('showProfile', false);
                        AuthService().signOut(context);
                        // AuthService().signOut().whenComplete(
                        //     () => Navigator.of(context).pushAndRemoveUntil(
                        //         MaterialPageRoute(
                        //             builder: (context) => const MyApp(
                        //                   showProfile: false,
                        //                 )),
                        //         (route) => false));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
