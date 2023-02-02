import 'package:flutter/material.dart';
import 'package:test_project/page/setting_tab/widget/commandMenu.dart';
import 'package:test_project/service/controllre/function.dart';
import 'package:test_project/style/main_app_color.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainAppColor.topBarColor,
        title: const Text('History'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  HistoryFunction().clearAccessLog();
                });
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: HistoryFunction().getAccessLog(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final lastTime = snapshot.data!.reversed.elementAt(index);
                return CommandMenu(
                  prefixText: Text(lastTime),
                  suffixWidget: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () async {
                        setState(() {
                          HistoryFunction().removeAccessLog(index);
                        });
                      }),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
