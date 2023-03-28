import 'package:firebase_auth/firebase_auth.dart';
import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';

class SignupButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupButton({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      'Signup',
      onTap: _onTapSignupButton,
      width: double.infinity,
    );
  }

  void _onTapSignupButton(BuildContext context) async {
    if (emailController.text.contains('@') == false) {
      EasyLoading.showError('Enter a valid email.');
    } else if (passwordController.text != confirmPasswordController.text) {
      EasyLoading.showError('Passwords do no match.');
    } else {
      try {
        EasyLoading.show();
        final auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text);

        final User? user = auth.currentUser;
        if (user != null) {
          final localUser = LocalUser(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
          );
          userRepository.add(localUser);
          context.read<UserProvider>().updateUser(localUser);

          EasyLoading.dismiss();
          Navigator.pushReplacementNamed(context, TabScreen.routeName);
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError('Could not login, please try again.');
        }
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        if (e.code == 'weak-password') {
          EasyLoading.showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.showError('The account already exists for that email.');
        } else {
          EasyLoading.showError('Something bad occurred.\n$e');
        }
      }
    }
  }
}
