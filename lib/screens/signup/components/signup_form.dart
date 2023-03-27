import 'package:playon/all_utils.dart';
import 'package:playon/screens/signup/components/caption_text_field.dart';
import 'package:playon/screens/signup/components/signup_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
    return Column(
      children: [
        'Let\'s Get Started!!!'.toText(fontSize: 32.0),
        'Create an account to continue'
            .toText(fontSize: 17.0, color: AppTheme.lightBlueGreyColor),
        const VerticalSpacing(of: 50),
        CaptionTextField(controller: _nameController, caption: 'Name'),
        const VerticalSpacing(of: 30),
        CaptionTextField(
          controller: _emailController,
          caption: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const VerticalSpacing(of: 30),
        CaptionTextField(
          controller: _phoneController,
          caption: 'Phone',
          keyboardType: TextInputType.phone,
        ),
        const VerticalSpacing(of: 30),
        CaptionTextField(
          controller: _passwordController,
          caption: 'Password',
          obscure: true,
        ),
        const VerticalSpacing(of: 30),
        CaptionTextField(
          controller: _confirmPasswordController,
          caption: 'Confirm Password',
          obscure: true,
        ),
        const VerticalSpacing(of: 30),
        SignupButton(
          nameController: _nameController,
          emailController: _emailController,
          phoneController: _phoneController,
          passwordController: _passwordController,
          confirmPasswordController: _confirmPasswordController,
        ),
      ],
    );
  }
}
