import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  TabScreen.routeName: (context) => const TabScreen(),
};
