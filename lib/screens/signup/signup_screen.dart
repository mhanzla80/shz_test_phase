import 'package:playon/all_utils.dart';
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
    return BaseScaffold(
      body: SignupForm(),
    );
  }
}
