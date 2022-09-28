import 'package:flutter/material.dart';
import 'package:test_project/model/model_whats_new.dart';
import 'package:test_project/network/response_list.dart';
import 'package:test_project/service/controllre/todo_controller.dart';
import 'package:test_project/service/repository/todo_repository.dart';
import 'package:test_project/style/main_app_color.dart';

class ShowListNew extends StatelessWidget {
  const ShowListNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());
    return Expanded(
      child: FutureBuilder<ResponseList<WhatsNewModel>?>(
        future: todoController.fetchWhatsNew(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.dataList.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      right: 10,
                      left: 10,
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: MainAppColor.introP2Color,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: MainAppColor.normalColor, width: 2)),
                        width: 54,
                        height: 54,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            snapshot.data?.dataList[index].iconPath ?? "",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      title: Text(
                        snapshot.data?.dataList[index].title ?? "",
                        style: MainFontstyle.mainFont1,
                      ),
                      subtitle: Text(
                        snapshot.data?.dataList[index].description ?? "",
                        style: MainFontstyle.mainFont1,
                      ),
                    ),
                  );
                });
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
    );
  }
}
