import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/model/data_docs_model.dart';
import 'package:test_project/model/register_model.dart';

final user = FirebaseAuth.instance.currentUser!;

// deleteTodos(item) {
//   DocumentReference documentReference =
//       FirebaseFirestore.instance.collection("${user.email}").doc(item);

//   documentReference.delete().whenComplete(() {
//     print("$item Deleted");
//   });
// }

class FirebaseService {
  Future<void> createEmailAndPassword(
      {required RegisterModel registerModel}) async {
    DocumentReference docsFile =
        FirebaseFirestore.instance.collection("User").doc("${user.email}");
    // registerModel.id = docsFile.id;

    final json = registerModel.toJson();

    await docsFile.set(json);
  }

  Future<void> createTodos({required DocsModel docsModel}) async {
    DocumentReference docsFile =
        FirebaseFirestore.instance.collection("${user.email}").doc();
    docsModel.id = docsFile.id;

    final json = docsModel.toJson();

    await docsFile.set(json);
  }

  Future<void> deleteTodos(dynamic item) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("${user.email}").doc(item);

    await documentReference.delete().whenComplete(() {
      print("$item Deleted");
    });
  }

  Future<void> updateTodos({required DocsModel docsModel}
      // String id,
      // String title,
      // String description,
      // String data,
      ) async {
    // final user = FirebaseAuth.instance.currentUser!;
    final docsFile = FirebaseFirestore.instance
        .collection("${user.email}")
        .doc(docsModel.id);

    final json = docsModel.toJson();

    await docsFile.update(
        // {
        json
        // 'title': title,
        // 'description': description,
        // 'data': data,
        // }
        );
  }
}

class HistoryFunction {
  Future<void> logAccess(String page) async {
    final prefs = await SharedPreferences.getInstance();
    final accessLog = prefs.getStringList('access_log') ?? [];
    final now = DateFormat('dd-MM-yyyy KK:mm:ss').format(DateTime.now());
    accessLog.add('${page} - ${now}');
    prefs.setStringList('access_log', accessLog);
  }

  Future<List<String>> getAccessLog() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('access_log') ?? [];
  }

  Future<void> clearAccessLog() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_log');
  }

  Future<void> removeAccessLog(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final accessLog = prefs.getStringList('access_log');
    if (accessLog != null) {
      accessLog.removeAt(index);
      prefs.setStringList('access_log', accessLog);
      // setState(() {
      //   accessLog;
      // });
    }
  }
}
