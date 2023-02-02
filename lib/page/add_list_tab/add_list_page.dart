import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/model/data_docs_model.dart';
import 'package:test_project/page/home_tab/view/profile_page.dart';
import 'package:test_project/service/controllre/function.dart';
import 'package:test_project/style/main_app_color.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final user = FirebaseAuth.instance.currentUser!;

  final titleText = TextEditingController();
  final descriptionText = TextEditingController();
  final dataText = TextEditingController();

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                "Title",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          height: 43,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              controller: titleText,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          width: MediaQuery.of(context).size.width,
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              controller: descriptionText,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToCreateTodos() {
    final todoDocs = DocsModel(
      title: titleText.text,
      description: descriptionText.text,
      data: dataText.text,
    );
    setState(() {
      HistoryFunction().logAccess('Add: ' + todoDocs.title.toString());
    });

    FirebaseService()
        .createTodos(docsModel: todoDocs)
        .then((value) => Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ProfilePage()),
              (route) => false,
            ));
  }

  Future<void> showBox(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => _navigateToCreateTodos(),
                  //  {
                  // final todoDocs = DocsModel(
                  //   title: titleText.text,
                  //   description: descriptionText.text,
                  //   data: dataText.text,
                  // );

                  // Navigator.pushAndRemoveUntil<void>(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (BuildContext context) =>
                  //           const ProfilePage()),
                  //   (route) => false,
                  // );
                  // },
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                      ),
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

  Widget _data() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Data",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          width: MediaQuery.of(context).size.width,
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              controller: dataText,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget mainList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              _title(),
              _description(),
              _data(),
            ],
          ),
        )),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showBox("Are you sure to done this task ?");
          },
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 198, 76, 1),
            ),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add List"),
        backgroundColor: MainAppColor.mainColor,
      ),
      body: Column(
        children: [
          mainList(),
          bottomBar(),
        ],
      ),
    );
  }
}
