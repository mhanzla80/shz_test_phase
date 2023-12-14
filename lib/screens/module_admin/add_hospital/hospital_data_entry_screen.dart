import 'package:flutter/material.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/module_admin/add_hospital/components/hospital_data_info_form.dart';
import 'package:provider/provider.dart';

class AddHospitalScreen extends StatelessWidget {
  static const String routeName = '/AddHospitalScreen';
  const AddHospitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final savedHospital =
        ModalRoute.of(context)?.settings.arguments as Hospital;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Children')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<AddDataProvider>(
          builder: (_, provider, __) {
            return HospitalDataForm(hospital: savedHospital);
          },
        ),
      ),
    );
  }
}
