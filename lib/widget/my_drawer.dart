import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_lists/screens/trash.dart';
import 'package:to_do_lists/screens/reminder.dart';
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Reminder()));
            },
          ),
          const ListTile(
            leading: Icon(Icons.archive_outlined),
            title: Text("Archive"),
          ),
          ListTile(
              leading: const Icon(MdiIcons.trashCanOutline),
              title: const Text("Trash"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Trash()));
              }),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text("Settings"),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const ListTile(
              leading: Icon(MdiIcons.logout),
              title: Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}
