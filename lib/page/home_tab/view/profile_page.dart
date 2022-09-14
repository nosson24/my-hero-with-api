import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/model/data_model.dart';
import 'package:test_project/network/response_list.dart';
import 'package:test_project/page/followers_tab/view/followers.dart';
import 'package:test_project/page/following_tab/view/following.dart';
import 'package:test_project/page/home_tab/bloc/floating_action_button.dart';
import 'package:test_project/page/home_tab/widget/edit_list.dart';
import 'package:test_project/service/controllre/todo_controller.dart';
import 'package:test_project/service/repository/todo_repository.dart';
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
  var todoController = TodoController(TodoRepository());

  Widget _listView() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: MainAppColor.normalColor,
        ),
        child: FutureBuilder<ResponseList<DataModel>?>(
          future: todoController.fetchTodoList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.dataList.length ?? 0,
                itemBuilder: (context, index) {
                  var todo = snapshot.data?.dataList[index];
                  return ButtonManu(
                    titleText: Text(
                      snapshot.data?.dataList[index].title ?? "",
                      style: MainFontstyle.mainFont1,
                    ),
                    subText: Text(
                      snapshot.data?.dataList[index].description ?? "",
                      style: MainFontstyle.mainFont1,
                    ),
                    onPressedToList: () {
                      _onNavigate(EditList(
                        todo: snapshot.data!.dataList[index],
                      ));
                    },
                    onPressedDelete: () {
                      _onDelete(todo!);
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _onDelete(todo) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Are you sure to done this task ?",
            style: MainFontstyle.mainFont2,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    todoController.deleteTodo(todo!);
                    Navigator.pop(context, true);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MainAppColor.mainColor,
                    ),
                    child: const Text(
                      "Yes",
                      style: MainFontstyle.mainFont1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MainAppColor.normalColor,
                    ),
                    child: const Text("No", style: MainFontstyle.mainFont2),
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
      floatingActionButton: const FloatingButton(),
      body: Container(
          decoration: const BoxDecoration(
            color: MainAppColor.mainColor,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 22,
              ),
              const AvatarProfile(
                imgPath: 'assets/imageProfile.png',
                name: 'Shoto Todoroki',
                status: 'student',
              ),
              FollowBar(
                onPressedFollowers: () {
                  _onNavigate(const FollowersPage());
                },
                onPressedFollowing: () {
                  _onNavigate(const FollowingPage());
                },
              ),
              _listView(),
              FutureBuilder<ResponseList<DataModel>?>(
                  future: todoController.fetchTodoList(),
                  builder: (context, snapshot) {
                    return BottomBar(
                      numberData: Text(
                        "${snapshot.data?.dataList.length} ${LocaleKeys.page_homeTab_listRemain.tr()} ",
                        // "0 Tasks remain",
                        style: GoogleFonts.roboto(
                          textStyle: MainFontstyle.mainFont2,
                        ),
                      ),
                    );
                  }),
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
}
