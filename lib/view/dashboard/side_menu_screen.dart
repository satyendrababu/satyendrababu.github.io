import 'package:flutter/material.dart';

class SideMenuScreen extends StatefulWidget {

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Dashboard')),
    Center(child: Text('Patients')),
    Center(child: Text('To Do')),
    Center(child: Text('My Notes')),
    Center(child: Text('Settings')),
    Center(child: Text('Logout')),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget buildSideMenu() {
    return Container(
      width: 250,
      color: Colors.blueGrey[50],
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'App Title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          buildMenuItem(
            icon: Icons.home_outlined,
            label: 'Dashboard',
            index: 0,
          ),
          buildMenuItem(
            icon: Icons.person_outline,
            label: 'Patients',
            index: 1,
          ),
          buildMenuItem(
            icon: Icons.check_box_outlined,
            label: 'To Do',
            index: 2,
          ),
          buildMenuItem(
            icon: Icons.note_outlined,
            label: 'My Notes',
            index: 3,
          ),
          buildMenuItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            index: 4,
          ),
          Spacer(),
          Divider(),
          buildMenuItem(
            icon: Icons.logout,
            label: 'Logout',
            index: 5,
          ),
        ],
      ),
    );
  }
  Widget buildMenuItem({IconData? icon, String? label, int? index}) {
    bool isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.black54,
      ),
      title: Text(
        label!,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black54,
        ),
      ),
      selected: isSelected,
      onTap: () => _onItemTapped(index!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side Menu
          buildSideMenu(),
          // Main Content
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}