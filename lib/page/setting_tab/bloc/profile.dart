import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class ListProFile extends StatelessWidget {
  const ListProFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Row(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName!, style: MainFontstyle.mainFont2,
                      // 'Wichan Chaijamras',
                    ),
                    Text(
                      user.email!, style: MainFontstyle.mainFontNameClass2,
                      // 'บริษัท ออนด์ดี้วิง จำกัด',
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: MainAppColor.introP2Color,
                                  ),
                                  height: 7,
                                  width: 7,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 4,
                                ),
                                child: const Text(
                                  'รอการอนุมัติ',
                                  style: MainFontstyle.mainFontNameClass3,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
