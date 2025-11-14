import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage>
    with WidgetsBindingObserver {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    debugPrint(state.toString());
  }

  
  void _onTappedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> bodyChildern = [HomePage(), FavoritePage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /* backgroundColor: Colors.grey[200], */
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text("Menu", style: TextStyle(color: Colors.white)),
              ),
              ListTile(leading: Icon(Icons.message), title: Text("Messages")),
              ListTile(leading: Icon(Icons.settings), title: Text("Settings")),

              ListTile(leading: Icon(Icons.person), title: Text("Profile")),
            ],
          ),
        ),

        appBar: AppBar(title: Text("Foodak"), centerTitle: true),

        body: bodyChildern[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTappedIndex,
         
          /* selectedItemColor: Theme.of(context).primaryColor, */
        ),
      ),
    );
  }
}
