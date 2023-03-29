import 'package:firebase_auth/firebase_auth.dart';
import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/widgets/my_elevated_button.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButton({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      onTap: () => _onTapLogin(context),
      title: 'Login',
    );
  }

  void _onTapLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (emailController.text.contains('@') == false) {
        EasyLoading.showError('Enter a valid email.');
        return;
      }

      try {
        EasyLoading.show();
        final userCredentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text);

        final email = userCredentials.user?.email;
        if (email != null) {
          final user = await userRepository.get(email);
          if (user != null) {
            final updatedUser = LocalUser(
              email: user.email,
              name: user.name,
              phone: user.phone,
            );
            final provider = context.read<UserProvider>();
            userRepository.update(user.email, {});
            provider.updateUser(updatedUser);
            EasyLoading.dismiss();

            Navigator.pushReplacementNamed(context, TabScreen.routeName);
          }
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError('No user found for that email.');
        }
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        if (e.code == 'user-not-found') {
          EasyLoading.showError('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          EasyLoading.showError('Wrong password provided for that user.');
        } else {
          EasyLoading.showError('Something bad occurred.\n$e');
        }
      }
    }
  }
}
