import 'package:crate_fire/constants/constants.dart' show defaultPadding;
import 'package:crate_fire/constants/routes.dart';
import 'package:crate_fire/enums/menu_actions.dart';
import 'package:crate_fire/service/auth/auth_service.dart';
import 'package:crate_fire/service/cloud/firestore_provider.dart';
import 'package:crate_fire/utilities/dialog/logout_dialog.dart';
import 'package:crate_fire/views/setup_profile.dart' show userId;
import 'package:flutter/material.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Add an appbar that has the same color has the scaffold with no elevation and a pop up menu button
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout) {
                  AuthService.fireBase().logout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    signInRoute,
                    (_) => false,
                  );
                }
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: MenuAction.logout,
                child: Text('Logout'),
              ),
            ];
          })
        ],
      ),
      body: FutureBuilder(
        future: FirestoreProvider.getUserdata(userId: userId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                final userData = snapshot.data!;
                final username = userData['username'];
                return Container(
                  margin: const EdgeInsets.only(top: defaultPadding * 3.5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.0,
                  child: Center(
                    child: Column(
                      children: [
                        Text('Welcome, $username'),
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
