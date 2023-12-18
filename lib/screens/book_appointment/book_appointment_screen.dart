import 'package:playon/all_utils.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/book_appointment/components/book_appointment_form.dart';

class BookAppointmentScreen extends StatelessWidget {
  static const String routeName = '/BookAppointmentScreen';
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<AddDataProvider>(
          builder: (_, provider, __) {
            return const BookAppointmentForm();
          },
        ),
      ),
    );
  }
}
