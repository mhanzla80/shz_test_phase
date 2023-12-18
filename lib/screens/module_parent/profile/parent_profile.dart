import 'package:flutter/material.dart';
import 'package:playon/providers/user_provider.dart';
import 'package:playon/screens/login/login_screen.dart';
import 'package:playon/screens/module_parent/change_password_screen.dart';
import 'package:playon/screens/module_parent/profile/view_profile_srceen.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ListTile.divideTiles(
            context: context,
            color: Colors.grey,
            tiles: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                },
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ViewProfileScreen.routeName);
                },
                title: const Text('My Profile'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () async {
                  await context.read<UserProvider>().logout();
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }
                },
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
