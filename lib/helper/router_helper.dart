import 'package:go_router/go_router.dart';
import 'package:simple_ehr/view/dashboard/dashboard_screen.dart';
import 'package:simple_ehr/view/main_screen.dart';
import 'package:simple_ehr/view/patients/patients_screen.dart';
import 'package:simple_ehr/view/to_do/to_do_screen.dart';

/*GoRouter appRouter = GoRouter(routes: [
  StatefulShellRoute.indexedStack(

      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/', builder: (context, state) => const MainScreen()),
          GoRoute(
              path: '/dashboard',
              builder: (context, state) => const DashboardScreen()),
          GoRoute(
              path: '/patients', builder: (context, state) => PatientsScreen()),
          GoRoute(path: '/to_do', builder: (context, state) => ToDoScreen()),
        ])
      ])
]);*/
class RouterHelper {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: 'mainScreen',
            path: '/',
          builder: (context, state) {
              return MainScreen();
          }
        ),
        GoRoute(
            name: 'dashboard',
            path: '/dashboard',
            builder: (context, state) {
              return DashboardScreen();
            }
        ),

      ]
  );
}
