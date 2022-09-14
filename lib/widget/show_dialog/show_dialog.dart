// import 'package:flutter/material.dart';
// import 'package:test_project/style/main_app_color.dart';

// class ShowDialog extends StatefulWidget {
//   const ShowDialog({Key? key}) : super(key: key);

//   @override
//   State<ShowDialog> createState() => _ShowDialogState();
// }

// class _ShowDialogState extends State<ShowDialog> {
//   void _onDelete() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) {
//         return AlertDialog(
//           title: const Text(
//             "Are you sure to done this task ?",
//             style: MainFontstyle.mainFont2,
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: () async {
//                     Navigator.pop(context, true);
//                     setState(() {});
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 66,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: MainAppColor.mainColor,
//                     ),
//                     child: const Text(
//                       "Yes",
//                       style: MainFontstyle.mainFont1,
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context, false);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 66,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: MainAppColor.normalColor,
//                     ),
//                     child: const Text("No", style: MainFontstyle.mainFont2),
//                   ),
//                 )
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _onDelete();
//   }
// }
