import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/add_children/children_data_entry_screen.dart';
import 'package:playon/screens/add_hospital/hospital_data_entry_screen.dart';
import 'package:playon/screens/book_appointment/book_appointment_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  TabScreen.routeName: (context) => const TabScreen(),
  AddChildScreen.routeName: (context) => const AddChildScreen(),
  AddHospitalScreen.routeName: (context) => const AddHospitalScreen(),
  BookAppointmentScreen.routeName: (context) => const BookAppointmentScreen(),
};
