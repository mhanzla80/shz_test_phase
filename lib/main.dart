import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // final title = message.notification?.title;
  // final description = message.notification?.body;
  // if (title != null && description != null) {
  //   storage.addNotification(
  //       LocalNotification(title: title, description: description));
  // }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await DependencyInjectionEnvironment.setup();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const PlayOn());
}

class PlayOn extends StatelessWidget {
  const PlayOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Play On',
        themeMode: ThemeMode.light,
        theme: AppTheme.buildTheme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MultiProvider(
            providers: [
              ListenableProvider(create: (_) => UserProvider()),
            ],
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: FlutterEasyLoading(child: widget),
            ),
          );
        },
      ),
    );
  }
}
