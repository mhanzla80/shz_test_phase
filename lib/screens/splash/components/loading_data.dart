import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';

class LoadingDataWidget extends StatefulWidget {
  const LoadingDataWidget({super.key});

  @override
  _LoadingDataWidgetState createState() => _LoadingDataWidgetState();
}

class _LoadingDataWidgetState extends State<LoadingDataWidget> {
  @override
  void initState() {
    super.initState();
    _initializeEveryThing();
  }

  void _initializeEveryThing() async {
    try {
      const imgSources = [];
      final assetPictures = imgSources.map((imgSrc) =>
          precacheImage(AssetImage('assets/images/$imgSrc.png'), context));
      await Future.wait(assetPictures);

      _moveToNextScreen(context);
    } on Exception catch (e) {
      EasyLoading.showError(
          'An error occurred while fetching location! Please re-run the app.');
    }
  }

  void _moveToNextScreen(BuildContext context) async {
    if (context.read<UserProvider>().user == null) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      Navigator.pushReplacementNamed(context, TabScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: const [
          VerticalSpacing(of: 10),
          LinearProgressIndicator(
            backgroundColor: AppTheme.lightBlueGreyColor,
          ),
        ],
      ),
    );
  }
}
