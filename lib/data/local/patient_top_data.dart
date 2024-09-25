import 'dart:ui';

import 'package:simple_ehr/model/patient_top_data_model.dart';

class PatientTopData {
  final topData = <PatientTopDataModel>[
    PatientTopDataModel(text: 'Positive Response', value: '200', valuePercent: '+2.5%', color: Color(0xFF00A389)),
    PatientTopDataModel(text: 'Pending Reports', value: '872', valuePercent: '+2.5%', color: Color(0xFFFF5B5B)),
    PatientTopDataModel(text: 'New Patients', value: '475', valuePercent: '+2.5%', color: Color(0xFF2C67F2)),
    PatientTopDataModel(text: 'Positive Case', value: '200', valuePercent: '+2.5%', color: Color(0xFFFEB052)),
  ];
}