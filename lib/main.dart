// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/wrapper/wrapper_screen.dart';
// import 'package:safetalk/firebase_options.dart';
import 'package:safetalk/helpers/functions/api_service_locator.dart';
// import 'package:safetalk/helpers/functions/api_service_locator.dart';
import 'package:safetalk/helpers/functions/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await apiServiceLocator();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WrapperScreen.path,
        home: WrapperScreen(),
        smartManagement: SmartManagement.keepFactory,
        getPages: AppPages.appPages,
      ),
    );
  }
}
