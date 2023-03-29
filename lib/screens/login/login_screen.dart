import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/login/components/login_button.dart';
import 'package:playon/screens/signup/components/aligned_text_button.dart';
import 'package:playon/widgets/header_text.dart';
import 'package:playon/widgets/labeled_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AlignedTextButton(onTap: _onTapSignup, title: 'Signup'),
              const VerticalSpacing(),
              const HeaderText(
                  header: 'Welcome Back', subtitle: 'Please login to continue'),
              const VerticalSpacing(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LabeledTextField(
                      controller: _emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const VerticalSpacing(),
                    LabeledTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obscure: true,
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(of: 30),
              LoginButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const VerticalSpacing(of: kDefaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }

  static void _onTapSignup(BuildContext context) {
    Navigator.pushReplacementNamed(context, SignupScreen.routeName);
  }
}
