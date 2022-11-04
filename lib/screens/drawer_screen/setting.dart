// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_lists/read%20data/get_user_data.dart';
import 'package:to_do_lists/widget/my_drawer.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> docIds = [];

  final user = FirebaseAuth.instance.currentUser!;

  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .orderBy('first name', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(user.email!),
      ),
      drawer: const MyDrawer(),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getDocIds(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docIds.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListTile(
                      title: GetUserData(documentIDs: docIds[index]),
                      tileColor: Theme.of(context).backgroundColor,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
