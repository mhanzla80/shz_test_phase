import 'package:playon/all_utils.dart';
import 'package:playon/models/appointment.dart';
import 'package:playon/models/role.dart';
import 'package:playon/screens/module_admin/pdf/appointment_pdf_view.dart';
import 'package:playon/screens/module_hospital/view_appointments/component/appointment_details_card.dart';
import 'package:playon/screens/module_hospital/view_appointments/component/appointment_list_provider.dart';
import 'package:playon/widgets/last_days_filter.dart';

class ViewAppointmentsScreen extends StatelessWidget {
  static const String routeName = "/ViewAppointmentsScreen";

  const ViewAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => AppointmentListProvider(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Appointments'),
            actions: [
              IconButton(
                onPressed: () => onPressFilter(context),
                icon: const Icon(Icons.filter_alt),
              ),
            ],
          ),
          body: FutureBuilder<List<Appointment>>(
            future: context.read<AppointmentListProvider>().getAppointments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }

                final data = snapshot.data;
                if (data != null && data.isNotEmpty) {
                  return Column(
                    children: [
                      if (PrefsStorage.instance.user?.role == Role.admin)
                        IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, AppointmentPdfView.routeName,
                              arguments: data),
                          icon: const Icon(Icons.picture_as_pdf_rounded),
                        ),
                      Expanded(child: const AppointmentListView()),
                    ],
                  );
                } else {
                  return const Center(
                      child: Text(
                    'No Data',
                    style: TextStyle(fontSize: 18),
                  ));
                }
              }

              return const Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        );
      },
    );
  }

  void onPressFilter(BuildContext context) async {
    final days = await showModalBottomSheet<int>(
        context: context, builder: (_) => const LastDaysFilter());
    if (days != null) {
      context.read<AppointmentListProvider>().filterByDays(days);
    }
  }
}

class AppointmentListView extends StatelessWidget {
  const AppointmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentListProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: provider.filteredList.length,
          itemBuilder: (ctx, index) {
            return AppointmentDetailsCard(
              appointmentDetails: provider.filteredList[index],
            );
          },
        );
      },
    );
  }
}
