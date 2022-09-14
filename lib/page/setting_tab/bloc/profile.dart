import 'package:flutter/material.dart';

class ListProFile extends StatelessWidget {
  const ListProFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Container(
          color: Colors.white,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/imageProfile.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wichan Chaijamras',
                    ),
                    const Text(
                      'บริษัท ออนด์ดี้วิง จำกัด',
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.amber[700],
                                  ),
                                  height: 7,
                                  width: 7,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                child: const Text(
                                  'รอการอนุมัติ',
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),],
    );
  }
}
