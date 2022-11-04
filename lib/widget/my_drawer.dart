import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_lists/main.dart';
import 'package:to_do_lists/screens/drawer_screen/trash.dart';
import 'package:to_do_lists/widget/rich_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.all(16), child: WidgetRichText()),
          ListTile(
            leading: const Icon(MdiIcons.lightbulbOutline),
            title: const Text("ToDo Notes"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.bellOutline),
            title: const Text("Reminders"),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.reminder);
            },
          ),
          ListTile(
              leading: const Icon(MdiIcons.trashCanOutline),
              title: const Text("Trash"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Trash()));
              }),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.setting);
            },
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(
                horizontal: 3,
              )),
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: GestureDetector(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
