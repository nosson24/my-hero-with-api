import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class BottomBar extends StatelessWidget {
  final Text? numberData;
  const BottomBar({Key? key, this.numberData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(color: MainAppColor.bottomBarColor),
          child: Container(
            margin: const EdgeInsets.only(left: 28),
            child: numberData,
            // Text(
            //   "${ToDoListService.getToDoList().length} Tasks remain",
            //   style: GoogleFonts.roboto(
            //     textStyle: MainFontstyle.mainFont2,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
