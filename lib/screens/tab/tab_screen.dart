import 'package:playon/all_utils.dart';
import 'package:playon/screens/tab/components/notched_bottom_navigation_bar.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = '/TabScreen';

  const TabScreen();

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final List<Widget> tabWidgets = [
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: tabWidgets,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NotchedBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);
}
