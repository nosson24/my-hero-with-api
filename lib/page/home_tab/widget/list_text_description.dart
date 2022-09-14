// import 'package:flutter/material.dart';
// import 'package:test_project/model/data_model.dart';
// import 'package:test_project/page/home_tab/view/profile_page.dart';
// import 'package:test_project/style/main_app_color.dart';

// class TaskDetail extends StatelessWidget {
//   const TaskDetail({
//     Key? key,
//     required this.todo,
//     this.onPressed,
//   }) : super(key: key);
//   final DataModel todo;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Task detail", style: MainFontstyle.mainFont1),
//         actions: [
//           IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
//         ],
//         backgroundColor: MainAppColor.topBarColor,
//       ),
//       body: Container(
//         color: MainAppColor.mainColor,
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width,
//                   height: 85,
//                   decoration: const BoxDecoration(
//                     color: MainAppColor.mainColor,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 20,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         todo.title ?? "",
//                         style: MainFontstyle.mainFont1,
//                       ),
//                       subtitle: Text(
//                         todo.description ?? "",
//                         style: MainFontstyle.mainFont1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 86,
//                     height: 85,
//                     decoration: const BoxDecoration(
//                       color: MainAppColor.buttonColor,
//                     ),
//                     child: GestureDetector(
//                       child: const Text(
//                         "Done",
//                         style: MainFontstyle.mainFont1,
//                       ),
//                       onTap: () => showDialog(
//                           context: context,
//                           barrierDismissible: false,
//                           builder: (_) {
//                             return AlertDialog(
//                               title: const Text(
//                                   "Are you sure to done this task ?",
//                                   style: MainFontstyle.mainFont2),
//                               actions: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     InkWell(
//                                       onTap: () async {
//                                         Navigator.pushAndRemoveUntil<void>(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (BuildContext context) =>
//                                                   const ProfilePage()),
//                                           (route) => false,
//                                         );
//                                       },
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: 66,
//                                         height: 45,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           color: MainAppColor.mainColor,
//                                         ),
//                                         child: const Text(
//                                           "Yes",
//                                           style: MainFontstyle.mainFont1,
//                                         ),
//                                       ),
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pop(context, false);
//                                       },
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: 66,
//                                         height: 45,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(15),
//                                           color: MainAppColor.normalColor,
//                                         ),
//                                         child: const Text(
//                                           "No",
//                                           style: MainFontstyle.mainFont2,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             );
//                           }),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 color: MainAppColor.normalColor,
//                 child: ListView(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(
//                         top: 10,
//                         left: 35,
//                         right: 35,
//                       ),
//                       child: Text(
//                         todo.data ?? "",
//                         style: MainFontstyle.mainFont2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
