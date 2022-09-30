import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;
deleteTodos(item) {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("${user.email}").doc(item);

  documentReference.delete().whenComplete(() {
    print("$item Deleted");
  });
}
