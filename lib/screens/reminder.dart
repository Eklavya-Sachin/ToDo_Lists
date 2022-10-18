import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widget/my_drawer.dart';

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Remainder',
        ),
        elevation: 0,
      ),
      // backgroundColor: tdBgColor,
      drawer: const MyDrawer(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: const Icon(
            MdiIcons.bellOutline,
            size: 100,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            "ToDo Notes remainder appear here",
          ),
        )
      ]),
    );
  }
}
