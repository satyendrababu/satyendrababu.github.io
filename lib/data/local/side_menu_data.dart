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

  final sideMenuData = const <MenuModel>[
    MenuModel(icon: IconsM.info, title: 'Information'),
    MenuModel(icon: IconsM.history, title: 'History'),
    MenuModel(icon: IconsM.temperature, title: 'Results'),
    MenuModel(icon: IconsM.pil, title: 'Medication'),
    MenuModel(icon: IconsM.myNote, title: 'Notes'),
    MenuModel(icon: IconsM.order, title: 'Order'),
    MenuModel(icon: IconsM.stethoscope, title: 'Communicate'),
    /*MenuModel(icon: '', title: ''),
    MenuModel(icon: '', title: ''),
    MenuModel(icon: '', title: ''),*/
  ];

  final toDoMenuData = const <MenuModel>[
    MenuModel(icon: IconsM.lowTag, title: 'Low'),
    MenuModel(icon: IconsM.importantTag, title: 'Important'),
    MenuModel(icon: IconsM.highTag, title: 'High'),
    MenuModel(icon: IconsM.addRingGrey, title: 'Add label'),

  ];
  final labTestData = const <MenuModel>[
    MenuModel(icon: '09-12-2016', title: 'Urine Pregnancy Test'),
    MenuModel(icon: '09-12-2016', title: 'Urine Dipstick'),
    MenuModel(icon: '09-12-2016', title: 'TB PPD Skin Test'),
    MenuModel(icon: '09-12-2016', title: 'Vision Testing'),
    MenuModel(icon: '09-12-2016', title: 'Breathalyzer'),
    MenuModel(icon: '09-12-2016', title: 'Rapid Strep'),
    MenuModel(icon: '09-12-2016', title: 'TB PPD Skin Test Result'),
  ];
}