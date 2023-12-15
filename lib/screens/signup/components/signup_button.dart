import 'package:firebase_auth/firebase_auth.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/models/role.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/module_admin/tab/admin_tab_screen.dart';
import 'package:playon/widgets/my_elevated_button.dart';
import 'package:uuid/uuid.dart';

class SignupButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final Role role;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignupButton({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.role,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      title: 'Signup',
      onTap: () => _onTapSignupButton(context),
    );
  }

  void _onTapSignupButton(BuildContext context) async {
    if (formKey.currentState!.validate()) {
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
              role: role,
            );

            userRepository.add(localUser);
            context.read<UserProvider>().updateUser(localUser);
            final addDataProvider = context.read<AddDataProvider>();

            EasyLoading.dismiss();
            if (role == Role.admin) {
              Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
            } else if (role == Role.hospital) {
              final uniqueId = const Uuid().v4();

              final hospital = Hospital(
                id: uniqueId,
                hospitalName: localUser.name ?? '',
                email: localUser.email,
                phoneNo: localUser.phone ?? '',
                address: '',
                aboutHospital: '',
              );

              await addDataProvider.addHospitalToDB(hospital);
              Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
            } else if (role == Role.parent) {
              Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
            }
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
}
