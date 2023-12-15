import 'package:playon/all_utils.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/role.dart';
import 'package:playon/providers/add_data_provider.dart';

class AppointmentDetailsCard extends StatefulWidget {
  final Appointment appointmentDetails;
  const AppointmentDetailsCard({super.key, required this.appointmentDetails});

  @override
  State<AppointmentDetailsCard> createState() => _AppointmentDetailsCardState();
}

class _AppointmentDetailsCardState extends State<AppointmentDetailsCard> {
  late AppointmentStatus status = widget.appointmentDetails.status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.appointmentDetails.childName),
        children: [
          ListTile(
            dense: true,
            title: const Text('Hospital Name'),
            trailing: Text(widget.appointmentDetails.hospitalName),
          ),
          ListTile(
            dense: true,
            title: const Text('Parent Name'),
            trailing: Text(widget.appointmentDetails.parentName),
          ),
          ListTile(
            dense: true,
            title: const Text('Phone No'),
            trailing: Text(widget.appointmentDetails.phoneNo),
          ),
          ListTile(
            dense: true,
            title: const Text('App. Date'),
            trailing: Text(widget.appointmentDetails.appDate.formattedDate),
          ),
          ListTile(
            dense: true,
            title: const Text('App. Time'),
            trailing: Text(widget.appointmentDetails.appDate.formattedTime),
          ),
          ListTile(
            dense: true,
            title: const Text('Current Status'),
            trailing: Text(widget.appointmentDetails.status.name),
          ),
          if (PrefsStorage.instance.user?.role == Role.hospital)
            ListTile(
              dense: true,
              title: DropdownButtonFormField<AppointmentStatus>(
                isDense: true,
                value: status,
                items: AppointmentStatus.values
                    .map(
                      (d) => DropdownMenuItem(
                        value: d,
                        child: Text(d.name),
                      ),
                    )
                    .toList(),
                onChanged: (val) => setState(() => status = val!),
              ),
              trailing: ElevatedButton(
                onPressed: () =>
                    updateAppStatus(widget.appointmentDetails, status),
                child: const Text('Update'),
              ),
            ),
        ],
      ),
    );
  }

  void updateAppStatus(
      Appointment appointmentDetails, AppointmentStatus status) async {
    final provider = context.read<AddDataProvider>();
    final updatedAppointment = Appointment(
        id: appointmentDetails.id,
        childName: appointmentDetails.childName,
        hospitalName: appointmentDetails.hospitalName,
        hospitalEmail: appointmentDetails.hospitalEmail,
        parentName: appointmentDetails.parentName,
        phoneNo: appointmentDetails.phoneNo,
        reference: appointmentDetails.reference,
        appDate: appointmentDetails.appDate,
        status: status);
    await provider.updateAppStatus(updatedAppointment);
  }
}
