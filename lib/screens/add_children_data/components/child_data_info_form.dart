import 'package:flutter/material.dart';
import 'package:playon/providers/generate_cv_provider.dart';
import 'package:playon/widgets/labeled_text_field.dart';
import 'package:playon/widgets/my_elevated_button.dart';
import 'package:provider/provider.dart';

class ChildDataForm extends StatefulWidget {
  const ChildDataForm({Key? key}) : super(key: key);

  @override
  State<ChildDataForm> createState() => _ChildDataFormState();
}

class _ChildDataFormState extends State<ChildDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _aboutYou = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _aboutYou.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Text(
            'Personal Information',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: LabeledTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  hint: 'Jhon',
                  maxLetters: 10,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LabeledTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  hint: 'Jhon',
                  maxLetters: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LabeledTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'user@example.com',
            maxLetters: 30,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: LabeledTextField(
                  controller: _phoneController,
                  label: 'Phone No',
                  hint: '+92 12345678',
                  maxLetters: 20,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LabeledTextField(
                  controller: _ageController,
                  label: 'Age',
                  hint: '18',
                  maxLetters: 20,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LabeledTextField(
            controller: _addressController,
            label: 'Address',
            hint: 'Model Town, Lahore',
            keyboardType: TextInputType.streetAddress,
            maxLine: 5,
            maxLetters: 40,
          ),
          const SizedBox(height: 20),
          LabeledTextField(
            controller: _aboutYou,
            label: 'About Him',
            hint: 'About Himself/Herself',
            keyboardType: TextInputType.multiline,
            maxLine: 5,
            maxLetters: 40,
          ),
          const SizedBox(height: 20),
          MyElevatedButton(onTap: _onTapMoveToNext),
        ],
      ),
    );
  }

  void _onTapMoveToNext() {
    final provider = context.read<ChildrenDataProvider>();
    if (_formKey.currentState!.validate()) {
      provider.storePersonalInfoFormStep1(
          _firstNameController.text,
          _lastNameController.text,
          _emailController.text,
          _phoneController.text,
          _addressController.text,
          _ageController.text,
          _aboutYou.text);
    }
  }
}
