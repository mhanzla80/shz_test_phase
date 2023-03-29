import 'package:flutter/material.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/widgets/my_elevated_button.dart';
import 'package:provider/provider.dart';

class BookAppointmentForm extends StatefulWidget {
  const BookAppointmentForm({Key? key}) : super(key: key);

  @override
  State<BookAppointmentForm> createState() => _BookAppointmentFormState();
}

class _BookAppointmentFormState extends State<BookAppointmentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _hospitalNameController = TextEditingController();
  String? _selectedChildName;
  String? _selectedHospitalName;

  @override
  void dispose() {
    _childNameController.dispose();
    _hospitalNameController.dispose();
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
            'Appointment Information',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            isDense: true,
            hint: const Text('Choose a Child'),
            value: _selectedChildName,
            items: context
                .read<AddDataProvider>()
                .allHospitals
                ?.map((d) => DropdownMenuItem(
                      value: d,
                      child: Text(d),
                    ))
                .toList(),
            onChanged: (val) => setState(() {
              _childNameController.text = val ?? '';
              _selectedChildName = val ?? '';
            }),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            isDense: true,
            hint: const Text('Choose a Hospital'),
            value: _selectedHospitalName,
            items: context
                .read<AddDataProvider>()
                .allHospitals
                ?.map((d) => DropdownMenuItem(
                      value: d,
                      child: Text(d),
                    ))
                .toList(),
            onChanged: (val) => setState(() {
              _hospitalNameController.text = val ?? '';
              _selectedHospitalName = val ?? '';
            }),
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
      final isSuccessful = await provider.bookAppointment(
        _hospitalNameController.text,
        _hospitalNameController.text,
      );
      if (mounted && isSuccessful) Navigator.pop(context);
    }
  }
}
