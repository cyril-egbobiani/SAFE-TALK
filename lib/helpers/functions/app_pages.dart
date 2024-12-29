// import 'package:frontend_ams_mobile_official/feautures/attendanceHistory/screen/history_page.dart';
//  import 'package:frontend_ams_mobile_official/feautures/home/screen/welcome_page.dart';
// import 'package:frontend_ams_mobile_official/feautures/login/screen/login_page.dart';
// import 'package:frontend_ams_mobile_official/feautures/register/screen/register_screen.dart';
// import 'package:get/get.dart';

// import '../../feautures/wrapper/wrapper_screen.dart';

import 'package:get/get.dart';
import 'package:safetalk/features/categories/view/categories_page.dart';
import 'package:safetalk/features/home/view/home_page.dart';
import 'package:safetalk/features/login/view/login_page.dart';
import 'package:safetalk/features/sign_up/view/signup_page.dart';
import 'package:safetalk/features/wrapper/wrapper_screen.dart';
import 'package:safetalk/helpers/widgets/bottomnavbar.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(
      name: WrapperScreen.path,
      page: () => WrapperScreen(),
    ),
    GetPage(
      name: SignupPage.path,
      page: () => SignupPage(),
    ),
    GetPage(
      name: LoginPage.path,
      page: () => LoginPage(),
    ),
    GetPage(
      name: HomePage.path,
      page: () => HomePage(),
    ),
    GetPage(
      name: Bottomnavbar.path,
      page: () => Bottomnavbar(),
    ),
    // GetPage(
    //   name: PostPage.path,
    //   page: () => PostPage(),
    // ),
    GetPage(
      name: CategoriesPage.path,
      page: () => CategoriesPage(),
    ),

    // GetPage(
    //   name: WelcomePage.path,
    //   page: () => WelcomePage(),
    // ),
    // GetPage(
    //   name: HistoryPage.path,
    //   page: () => HistoryPage(),
    // ),
    // GetPage(
    //   name: RegisterScreen.path,
    //   page: () => RegisterScreen(),
    // ),
  ];
}
