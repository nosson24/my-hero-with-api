import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test_project/page/add_list_tab/add_list_page.dart';
import 'package:test_project/page/setting_tab/view/setting.dart';
import 'package:test_project/service/auth_sercive/auth_service.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/translations/locale_keys.g.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      buttonSize: const Size(65.0, 65.0),
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: MainAppColor.buttonColor,
      spacing: 15,
      spaceBetweenChildren: 15,
      children: [
        SpeedDialChild(
            backgroundColor: MainAppColor.buttonColor,
            child: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingPage()));
            },
            label: LocaleKeys.page_settingTab_setTing.tr()),
        SpeedDialChild(
            backgroundColor: MainAppColor.buttonColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(
                      MaterialPageRoute(builder: (context) => const AddTask()))
                  .then((_) => setState(() {}));
            },
            label: LocaleKeys.page_homeTab_add.tr()),
      ],
    );
  }
}
