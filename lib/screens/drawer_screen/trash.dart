import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:to_do_lists/widget/my_drawer.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trash',
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
            MdiIcons.trashCanOutline,
            size: 100,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text(
            "No notes in Trash",
          ),
        )
      ]),
    );
  }
}
