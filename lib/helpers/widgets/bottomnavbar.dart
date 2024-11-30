import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:safetalk/features/home/screen/home_page.dart';
import 'package:safetalk/features/message/view/message_page.dart';
import 'package:safetalk/helpers/constants/color.dart';
import 'package:safetalk/helpers/widgets/bottonNavBar_controller.dart';

class Bottomnavbar extends StatelessWidget {
  Bottomnavbar({super.key});
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  static const String path = "/BottomNavBar";
  final List<Widget> screens = [
    HomePage(),
    MessagePage(),
    const Center(child: Text("Settings Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Obx(() => screens[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.red, // Background color
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r), // Responsive radius
              topRight: Radius.circular(15.r), // Responsive radius
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2.r,
                blurRadius: 10.r,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex.value,
            onTap: bottomNavController.updateIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                  'assets/logo/Subtract.svg',
                  0, // Index for this item
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  'assets/logo/Subtract(1).svg',
                  1, // Index for this item
                ),
                label: "Message",
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  'assets/logo/Vector(1).svg',
                  2, // Index for this item
                ),
                label: "Profile",
              ),
            ],
            selectedLabelStyle: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 10.sp, // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 10.sp, // Responsive font size
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    return Obx(
      () => SvgPicture.asset(
        assetPath,
        height: 20.h,
        width: 20.w,  
        colorFilter: ColorFilter.mode(
          bottomNavController.selectedIndex.value == index
              ? primaryColor
              : Colors.grey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
