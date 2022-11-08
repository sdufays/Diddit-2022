import 'package:diddit_final/presentation/splash_screen/splash_screen.dart';
import 'package:diddit_final/presentation/splash_screen/binding/splash_binding.dart';
import 'package:diddit_final/presentation/register_screen/register_screen.dart';
import 'package:diddit_final/presentation/register_screen/binding/register_binding.dart';
import 'package:diddit_final/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:diddit_final/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';
import 'package:diddit_final/presentation/upcoming_screen/binding/upcoming_binding.dart';
import 'package:diddit_final/presentation/assignment_screen/assignment_screen.dart';
import 'package:diddit_final/presentation/assignment_screen/binding/assignment_binding.dart';
import 'package:diddit_final/presentation/completed_screen/completed_screen.dart';
import 'package:diddit_final/presentation/completed_screen/binding/completed_binding.dart';
import 'package:diddit_final/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:diddit_final/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen = '/splash_screen';

  static String registerScreen = '/register_screen';

  static String signInScreen = '/sign_in_screen';

  static String upcomingScreen = '/upcoming_screen';

  static String assignmentScreen = '/assignment_screen';

  static String completedScreen = '/completed_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
    ),
    GetPage(
      name: upcomingScreen,
      page: () => UpcomingScreen(),
      bindings: [
        UpcomingBinding(),
      ],
    ),
    GetPage(
      name: assignmentScreen,
      page: () => UpcomingScreen(),
      bindings: [
        AssignmentBinding(),
      ],
    ),
    GetPage(
      name: completedScreen,
      page: () => CompletedScreen(),
      bindings: [
        CompletedBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () =>
          SplashScreen(), // change this to test screens since we can't cross them for now
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
