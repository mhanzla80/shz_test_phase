import 'package:flutter/material.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/child_data_model.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/utils/storage/prefs_storage.dart';
import 'package:playon/widgets/my_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class BookAppointmentForm extends StatefulWidget {
  const BookAppointmentForm({Key? key}) : super(key: key);

  @override
  State<BookAppointmentForm> createState() => _BookAppointmentFormState();
}

class _BookAppointmentFormState extends State<BookAppointmentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ChildDataModel? _selectedChildName;
  Hospital? _selectedHospitalName;

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
            'Appointment Information',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<ChildDataModel>(
            isDense: true,
            hint: const Text('Choose a Child'),
            value: _selectedChildName,
            items: context
                .read<AddDataProvider>()
                .allChildren
                ?.map((d) => DropdownMenuItem(
                      value: d,
                      child: Text(d.firstName),
                    ))
                .toList(),
            onChanged: (val) => setState(() => _selectedChildName = val),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<Hospital>(
            isDense: true,
            hint: const Text('Choose a Hospital'),
            value: _selectedHospitalName,
            items: context
                .read<AddDataProvider>()
                .allHospitals
                ?.map((d) => DropdownMenuItem(
                      value: d,
                      child: Text(d.hospitalName),
                    ))
                .toList(),
            onChanged: (val) => setState(() => _selectedHospitalName = val),
          ),
          const SizedBox(height: 20),
          MyElevatedButton(onTap: _onTapMoveToNext, title: 'Book Appointment'),
        ],
      ),
    );
  }

  void _onTapMoveToNext() async {
    final provider = context.read<AddDataProvider>();
    if (_formKey.currentState!.validate()) {
      final uniqueId = const Uuid().v4();
      final appointment = Appointment(
        id: uniqueId,
        childName: _selectedChildName?.firstName ?? '',
        hospital: _selectedHospitalName?.hospitalName ?? '',
        parentName: PrefsStorage.instance.user?.name ?? '',
        phoneNo: PrefsStorage.instance.user?.phone ?? '',
        reference: PrefsStorage.instance.user?.email ?? '',
      );
      final isSuccessful = await provider.bookAppointment(appointment);
      if (mounted && isSuccessful) Navigator.pop(context);
    }
  }
}
