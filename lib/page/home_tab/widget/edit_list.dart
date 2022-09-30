import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/page/home_tab/view/profile_page.dart';
import 'package:test_project/style/main_app_color.dart';

class EditList extends StatefulWidget {
  // final VoidCallback? onPressed;
  final String id;
  final String title;
  final String descriptionText;
  final String dateText;
  const EditList({
    Key? key,
    // this.onPressed,
    required this.id,
    required this.title,
    required this.descriptionText,
    required this.dateText,
  }) : super(key: key);

  @override
  State<EditList> createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dataController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.descriptionText);
    dataController = TextEditingController(text: widget.dateText);
  }

  Future updateTodos() async {
    final user = FirebaseAuth.instance.currentUser!;
    final docsFile =
        FirebaseFirestore.instance.collection("${user.email}").doc(widget.id);

    docsFile.update({
      'title': titleController.text,
      'description': descriptionController.text,
      'data': dataController.text,
    });
  }

  Widget title() {
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
              style: MainFontstyle.mainFont2,
              controller: titleController,
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

  Widget description() {
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
              style: MainFontstyle.mainFont2,
              controller: descriptionController,
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
                  onTap: () {
                    updateTodos();
                    Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ProfilePage()),
                      (route) => false,
                    );
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

  Widget data() {
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
              style: MainFontstyle.mainFont2,
              controller: dataController,
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
              title(),
              description(),
              data(),
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
        title: const Text("Edit List"),
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
