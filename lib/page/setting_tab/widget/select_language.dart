import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/model/language_model.dart';
import 'package:test_project/page/setting_tab/widget/commandMenu.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/translations/locale_keys.g.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<String> currentLanguage;

  _saveLanguage(String language) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('language', language);

    currentLanguage = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('language') ?? 'ENG';
    });
  }

  @override
  void initState() {
    currentLanguage = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('language') ?? 'ENG';
    });
    super.initState();
  }

  Widget languageItem(LanguageModel lang, int index) {
    return FutureBuilder(
      future: currentLanguage,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CommandMenu(
                prefixText: Text(
                  lang.language,
                ),
                suffixWidget: snapshot.data == lang.lang
                    ? const Icon(
                        Icons.check,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                onPressed: () {
                  if (snapshot.data != lang.lang) {
                    _showBox(lang);
                  }
                },
              );
            }
        }
      },
    );
  }

  Future<void> _showBox(LanguageModel lang) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "you are sure?",
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await context.setLocale(Locale(lang.sd));
                    _saveLanguage(lang.lang);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 65,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber[700],
                    ),
                    child: const Text(
                      "Yes",
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 65,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: const Text(
                      "No",
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.page_settingTab_setLanguage.tr(),
          ),
          backgroundColor: MainAppColor.topBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: selectLanguage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return languageItem(
                      selectLanguage[index],
                      index,
                    );
                  }),
            )
          ]),
        ));
  }
}
