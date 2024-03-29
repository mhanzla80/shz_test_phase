import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/book_appointment/book_appointment_screen.dart';
import 'package:playon/screens/module_admin/add_children/children_data_entry_screen.dart';
import 'package:playon/screens/module_admin/add_hospital/hospital_data_entry_screen.dart';
import 'package:playon/screens/module_admin/pdf/appointment_pdf_view.dart';
import 'package:playon/screens/module_admin/tab/tab_screen.dart';
import 'package:playon/screens/module_admin/view_data/view_children_screen.dart';
import 'package:playon/screens/module_admin/view_data/view_hospitals_screen.dart';
import 'package:playon/screens/module_hospital/view_appointments/view_appointments_screen.dart';
import 'package:playon/screens/module_parent/change_password_screen.dart';
import 'package:playon/screens/module_parent/profile/view_profile_srceen.dart';
import 'package:playon/screens/notification/notification_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  TabScreen.routeName: (context) => const TabScreen(),
  AddChildScreen.routeName: (context) => const AddChildScreen(),
  AddHospitalScreen.routeName: (context) => const AddHospitalScreen(),
  BookAppointmentScreen.routeName: (context) => const BookAppointmentScreen(),
  ViewChildrenScreen.routeName: (context) => const ViewChildrenScreen(),
  ViewAppointmentsScreen.routeName: (context) => const ViewAppointmentsScreen(),
  ViewHospitalsScreen.routeName: (context) => const ViewHospitalsScreen(),
  ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  ViewProfileScreen.routeName: (context) => const ViewProfileScreen(),
  AppointmentPdfView.routeName: (context) => const AppointmentPdfView(),
};
