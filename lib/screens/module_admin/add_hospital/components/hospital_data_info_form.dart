import 'package:flutter/material.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/widgets/labeled_text_field.dart';
import 'package:playon/widgets/my_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HospitalDataForm extends StatefulWidget {
  final Hospital? hospital;
  const HospitalDataForm({Key? key, required this.hospital}) : super(key: key);

  @override
  State<HospitalDataForm> createState() => _HospitalDataFormState();
}

class _HospitalDataFormState extends State<HospitalDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aboutHospital = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.hospital == null) return;

    _hospitalNameController.text = widget.hospital?.hospitalName ?? '';
    _emailController.text = widget.hospital?.email ?? '';
    _phoneController.text = widget.hospital?.phoneNo ?? '';
    _addressController.text = widget.hospital?.address ?? '';
    _aboutHospital.text = widget.hospital?.aboutHospital ?? '';
  }

  @override
  void dispose() {
    _hospitalNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _aboutHospital.dispose();
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
            'Hospital Information',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LabeledTextField(
            controller: _hospitalNameController,
            label: 'First Name',
            hint: 'Jhon',
            maxLetters: 10,
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
          LabeledTextField(
            controller: _phoneController,
            label: 'Phone No',
            hint: '+92 12345678',
            maxLetters: 20,
            keyboardType: TextInputType.phone,
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
            controller: _aboutHospital,
            label: 'About Hospital',
            hint: 'About Hospital',
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

  void _onTapMoveToNext() async {
    final provider = context.read<AddDataProvider>();
    if (_formKey.currentState!.validate()) {
      String uniqueId = '';
      if (widget.hospital == null) {
        uniqueId = const Uuid().v4();
      } else {
        uniqueId = widget.hospital!.id;
      }

      final hospital = Hospital(
        id: uniqueId,
        hospitalName: _hospitalNameController.text,
        email: _emailController.text,
        phoneNo: _phoneController.text,
        address: _addressController.text,
        aboutHospital: _aboutHospital.text,
      );
      final isSuccessful = await provider.addHospitalToDB(hospital);
      if (mounted && isSuccessful) Navigator.pop(context);
    }
  }
}
