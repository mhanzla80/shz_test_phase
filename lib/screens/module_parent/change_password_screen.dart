import 'package:playon/all_utils.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/widgets/labeled_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/ChangePasswordScreen';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Change Password'.toText(fontSize: 20)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              const VerticalSpacing(),
              LabeledTextField(
                controller: _passwordController,
                label: 'New Password',
                obscure: true,
              ),
              const VerticalSpacing(of: 10),
              LabeledTextField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                obscure: true,
              ),
              const VerticalSpacing(of: 30),
              ElevatedButton(
                onPressed: changePassword,
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        EasyLoading.showError('Passwords do no match.');
      } else {
        context
            .read<AddDataProvider>()
            .changePassword(_passwordController.text);
      }
    }
  }
}
