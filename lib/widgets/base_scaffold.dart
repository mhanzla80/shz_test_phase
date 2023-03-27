import 'package:playon/all_utils.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;

  const BaseScaffold({
    required this.body,
    this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
        },
        child: body,
      ),
    );
  }
}
