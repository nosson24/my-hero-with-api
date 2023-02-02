import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/page/followers_tab/view/followers.dart';
import 'package:test_project/page/following_tab/view/following.dart';
import 'package:test_project/page/home_tab/widget/floating_action_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_project/page/home_tab/widget/edit_list.dart';
import 'package:test_project/service/controllre/function.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/translations/locale_keys.g.dart';
import 'package:test_project/widget/core/button/button_manu.dart';
import 'package:test_project/widget/core/card/appbar/bottom_bar.dart';
import 'package:test_project/widget/core/card/appbar/follow_bar.dart';
import 'package:test_project/widget/core/card/hero_profile/avatar_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Widget _listView() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MainAppColor.normalColor,
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("${user.email}")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshots.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot documentSnapshot = snapshots.data!.docs[index];
                return ButtonManu(
                  titleText: Text(
                    documentSnapshot["title"],
                    style: MainFontstyle.mainFont1,
                  ),
                  subText: Text(
                    documentSnapshot["description"],
                    style: MainFontstyle.mainFont1,
                  ),
                  onPressedToList: () {
                    _navigateToEditListPage(
                      documentSnapshot["id"],
                      documentSnapshot["title"],
                      documentSnapshot["description"],
                      documentSnapshot["data"],
                    );
                    // _onNavigate(EditList(
                    //   id: documentSnapshot["id"],
                    //   title: documentSnapshot["title"],
                    //   descriptionText: documentSnapshot["description"],
                    //   dataText: documentSnapshot["data"],
                    // ));
                  },
                  onPressedDelete: () => _navigateTodeleteTodos(
                    documentSnapshot["id"],
                    documentSnapshot["title"],
                  ),
                  // {
                  //   setState(() {
                  //     FirebaseService().deleteTodos(documentSnapshot["id"]);
                  //   });
                  // },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateTodeleteTodos(String id, String title) {
    setState(() {
      HistoryFunction().logAccess('Delete: $title');
    });
    setState(() {
      FirebaseService().deleteTodos(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      body: Container(
          decoration: const BoxDecoration(
            color: MainAppColor.mainColor,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              AvatarProfile(
                imgPath: 'assets/imageProfile.png',
                name: user.email!,
                status: 'student',
              ),
              FollowBar(
                onPressedFollowers: () => _navigateToFollowersPage(),
                onPressedFollowing: () => _navigateToFollowingPage(),
              ),
              _listView(),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("${user.email}")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (!snapshots.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return BottomBar(
                    numberData: Text(
                      "${snapshots.data?.docs.length} ${LocaleKeys.page_homeTab_listRemain.tr()} ",
                      style: GoogleFonts.roboto(
                        textStyle: MainFontstyle.mainFont2,
                      ),
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }

  void _onNavigate(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }

  void _navigateToFollowersPage() {
    setState(() {
      HistoryFunction().logAccess('Followers Page');
    });
    _onNavigate(const FollowersPage());
  }

  void _navigateToFollowingPage() {
    setState(() {
      HistoryFunction().logAccess('Following Page');
    });
    _onNavigate(const FollowingPage());
  }

  void _navigateToEditListPage(
      String id, String title, String descriptionText, String data) {
    setState(() {
      HistoryFunction().logAccess('Edit List Page');
    });
    _onNavigate(EditList(
      id: id,
      title: title,
      descriptionText: descriptionText,
      dataText: data,
    ));
  }
}
