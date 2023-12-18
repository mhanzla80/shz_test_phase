import 'package:playon/all_utils.dart';
import 'package:playon/widgets/labeled_text_field.dart';

class ViewProfileScreen extends StatefulWidget {
  static const String routeName = '/ViewProfileScreen';
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = PrefsStorage.instance.user?.name ?? '';
    _emailController.text = PrefsStorage.instance.user?.email ?? '';
    _phoneController.text = PrefsStorage.instance.user?.phone ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            LabeledTextField(controller: _nameController, label: 'Name'),
            const VerticalSpacing(of: 10),
            LabeledTextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const VerticalSpacing(of: 10),
            LabeledTextField(
              controller: _phoneController,
              label: 'Phone',
              keyboardType: TextInputType.phone,
            ),
            const VerticalSpacing(of: 10),
          ],
        ),
      ),
    );
  }
}
