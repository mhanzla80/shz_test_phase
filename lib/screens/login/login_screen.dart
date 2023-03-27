import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/login/components/login_button.dart';
import 'package:playon/screens/signup/components/aligned_text_button.dart';
import 'package:playon/screens/signup/components/caption_text_field.dart';
import 'package:playon/widgets/header_text.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                const AlignedTextButton(onTap: _onTapSignup, title: 'Signup'),
                const VerticalSpacing(of: 50),
                const HeaderText(
                    header: 'Welcome Back',
                    subtitle: 'Please login to continue'),
                const VerticalSpacing(of: 50),
                CaptionTextField(
                  controller: _emailController,
                  caption: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const VerticalSpacing(),
                CaptionTextField(
                  controller: _passwordController,
                  caption: 'Password',
                  obscure: true,
                ),
                const VerticalSpacing(of: 30),
                LoginButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const VerticalSpacing(of: kDefaultPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void _onTapSignup(BuildContext context) {
    Navigator.pushReplacementNamed(context, SignupScreen.routeName);
  }
}
