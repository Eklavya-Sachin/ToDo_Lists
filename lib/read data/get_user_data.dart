import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String documentIDs;

  const GetUserData({super.key, required this.documentIDs});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentIDs).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            '${data['first name']} ${data['last name']}, ${data['email']}',
            style: TextStyle(color: Theme.of(context).cardColor),
          );
        }
        return Text('Loading...',
            style: TextStyle(color: Theme.of(context).cardColor));
      },
    );
  }
}
