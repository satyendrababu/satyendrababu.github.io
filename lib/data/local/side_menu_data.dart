import 'package:simple_ehr/model/menu_model.dart';

import '../../utils/icons_m.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: IconsM.home, title: 'Dashboard'),
    MenuModel(icon: IconsM.patientAdd, title: 'Patients'),
    MenuModel(icon: IconsM.toDo, title: 'To Do'),
    MenuModel(icon: IconsM.myNote, title: 'My Nots'),
    MenuModel(icon: IconsM.setting, title: 'Setting'),
    MenuModel(icon: IconsM.logout, title: 'Logout'),
    /*MenuModel(icon: '', title: ''),
    MenuModel(icon: '', title: ''),
    MenuModel(icon: '', title: ''),*/
  ];
}