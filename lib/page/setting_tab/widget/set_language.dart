import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/page/setting_tab/bloc/commandMenu.dart';
import 'package:test_project/page/setting_tab/widget/select_language.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/translations/locale_keys.g.dart';

class SetLanguagePage extends StatefulWidget {
  const SetLanguagePage({Key? key}) : super(key: key);

  @override
  State<SetLanguagePage> createState() => _SetLanguagePageState();
}

class _SetLanguagePageState extends State<SetLanguagePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<String> currentLanguage;

  _loadData() {
    currentLanguage = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('language') ?? 'ENG';
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.page_settingTab_setUp.tr(),
          ),
          backgroundColor: MainAppColor.mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FutureBuilder(
                future: currentLanguage,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return CommandMenu(
                          prefixText: Text(
                            LocaleKeys.page_settingTab_language.tr(),
                          ),
                          suffixWidget: Row(
                            children: [
                              Text(
                                '${snapshot.data}',
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectLanguagePage()))
                                .then((value) {
                              _loadData();
                              setState(() {});
                            });
                          },
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ));
  }
}
