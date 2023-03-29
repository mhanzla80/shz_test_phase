import 'package:playon/all_utils.dart';
import 'package:playon/screens/login/login_screen.dart';
import 'package:playon/screens/signup/components/aligned_text_button.dart';
import 'package:playon/screens/signup/components/signup_button.dart';
import 'package:playon/widgets/labeled_text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          const AlignedTextButton(title: 'Login', onTap: _onTapLogin),
          const VerticalSpacing(),
          Align(
            alignment: Alignment.center,
            child: 'Let\'s Get Started!!!'.toText(fontSize: 32.0),
          ),
          Align(
            alignment: Alignment.center,
            child: 'Create an account to continue'
                .toText(fontSize: 17.0, color: AppTheme.lightBlueGreyColor),
          ),
          const VerticalSpacing(),
          LabeledTextField(controller: _nameController, label: 'Name'),
          const VerticalSpacing(of: 30),
          LabeledTextField(
            controller: _emailController,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const VerticalSpacing(of: 30),
          LabeledTextField(
            controller: _phoneController,
            label: 'Phone',
            keyboardType: TextInputType.phone,
          ),
          const VerticalSpacing(of: 30),
          LabeledTextField(
            controller: _passwordController,
            label: 'Password',
            obscure: true,
          ),
          const VerticalSpacing(of: 30),
          LabeledTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            obscure: true,
          ),
          const VerticalSpacing(of: 30),
          SignupButton(
            formKey: _formKey,
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
          ),
        ],
      ),
    );
  }

  static void _onTapLogin(BuildContext context) =>
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
}
