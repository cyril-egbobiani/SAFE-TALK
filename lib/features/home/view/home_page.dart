import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safetalk/features/home/view/post_page.dart';
import 'package:safetalk/helpers/constants/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String path = "/Welcome";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/logo/SafeTalk(1).svg",
                height: 14.h,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
              SvgPicture.asset(
                "assets/logo/Frame 80.svg",
                height: 30.h,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 1,
            indicatorColor: primaryColor,
            indicatorPadding: EdgeInsets.only(left: -30.w, right: -30.w),
            splashBorderRadius: BorderRadius.circular(20.r),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Popular Post',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PostPage(), // First tab with your home page
            PostPage(), // First tab with your home page
          ],
        ),
      ),
    );
  }
}
