import 'package:crate_fire/constants/constants.dart';
import 'package:crate_fire/service/auth/auth_exceptions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/firestore_provider.dart';
import 'package:crate_fire/utils/button.dart';
import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  String get userId => AuthService.fireBase().currentUser!.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirestoreProvider.getUserdata(userId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                final userData = snapshot.data!;
                final username = userData['username'];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                          borderRadius: defaultPadding,
                          buttonColor: const [Colors.black, Colors.black],
                          textColor: Colors.deepPurple,
                          buttonText: 'Hello $username'),
                    ],
                  ),
                );
              } else {
                throw UserNotFoundAuthException();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
