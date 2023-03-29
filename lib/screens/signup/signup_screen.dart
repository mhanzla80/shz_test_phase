import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/signup/components/aligned_text_button.dart';
import 'package:playon/screens/signup/components/signup_form.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: BaseScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            AlignedTextButton(title: 'Login', onTap: _onTapLogin),
            VerticalSpacing(of: 50),
            SignupForm(),
            VerticalSpacing(of: 30),
          ],
        ),
      ),
    );
  }

  static void _onTapLogin(BuildContext context) =>
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
}
