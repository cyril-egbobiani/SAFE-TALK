import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetalk/features/chats/view/chart_page.dart';
import 'package:safetalk/features/groups/view/groups_page.dart';
import 'package:safetalk/helpers/constants/color.dart';

class MessagePage extends StatelessWidget {
  MessagePage({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
                indicatorWeight: 1,
                indicatorColor: primaryColor,
                indicatorPadding: EdgeInsets.only(left: -45.w, right: -45.w),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[400],
                tabs: const [
                  Tab(
                    child: Text(
                      'Chats',
                      style: TextStyle(fontFamily: "Poppins-SemiBold"),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Groups',
                      style: TextStyle(fontFamily: "Poppins-SemiBold"),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: const [ChartPage(), GroupsPage()]),
        ));
    // Scaffold(
    //   appBar: AppBar(
    //     // leading: Padding(
    //     //   padding: EdgeInsets.all(10.w),
    //     //   child: SvgPicture.asset(
    //     //     'assets/logo/Vector 10.svg',
    //     //     height: 5.h,
    //     //     width: 5.w,
    //     //   ),
    //     // ),
    //     automaticallyImplyLeading: false,
    //     title: Text(
    //       "Chats",
    //       style: TextStyle(fontSize: 16.sp, fontFamily: "Poppins-Bold"),
    //     ),
    //     centerTitle: true,
    //   ),
    //   body:
    //   //  Padding(
    //   //   padding: EdgeInsets.symmetric(vertical: 10.h),
    //   //   child: ListView.builder(
    //   //     itemCount: helpers.length,
    //   //     itemBuilder: (context, index) {
    //   //       return Padding(
    //   //         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    //   //         child: Container(
    //   //             padding: EdgeInsets.all(8.r),
    //   //             width: double.infinity,
    //   //             height: 80.h, // Set the desired height for each container
    //   //             decoration: BoxDecoration(
    //   //               color: Colors.white,
    //   //               boxShadow: [
    //   //                 BoxShadow(
    //   //                   color: const Color(0XFF4242FE).withOpacity(0.25),
    //   //                   offset: const Offset(0, 0), // Shadow position
    //   //                   blurRadius: 5, // Blur effect
    //   //                 ),
    //   //               ],
    //   //               borderRadius: BorderRadius.circular(15.r),
    //   //             ),
    //   //             child: Row(
    //   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //               children: [
    //   //                 Row(
    //   //                   children: [
    //   //                     ClipRRect(
    //   //                       borderRadius: BorderRadius.circular(100.r),
    //   //                       child: Image.asset(
    //   //                         'assets/logo/minh-pham-HI6gy-p-WBI-unsplash(1).jpg',
    //   //                         width: 48.h,
    //   //                         height: 48.h,
    //   //                       ),
    //   //                     ),
    //   //                     SizedBox(
    //   //                       width: 10.w,
    //   //                     ),
    //   //                     Column(
    //   //                       mainAxisAlignment: MainAxisAlignment.center,
    //   //                       crossAxisAlignment: CrossAxisAlignment.start,
    //   //                       children: [
    //   //                         Text(
    //   //                           "name",
    //   //                           style: TextStyle(
    //   //                               fontFamily: "Poppins-SemiBold",
    //   //                               fontSize: 14.sp),
    //   //                         ),
    //   //                         Text(
    //   //                           'message',
    //   //                           style: TextStyle(
    //   //                               fontFamily: "Poppins-Regular",
    //   //                               fontSize: 12.sp,
    //   //                               color: Colors.grey),
    //   //                         )
    //   //                       ],
    //   //                     )
    //   //                   ],
    //   //                 ),
    //   //                 Row(
    //   //                   children: [
    //   //                     ClipRRect(
    //   //                       borderRadius: BorderRadius.circular(100.r),
    //   //                       child: Container(
    //   //                         height: 20.h,
    //   //                         width: 20.h,
    //   //                         color: secondaryColor,
    //   //                         child: Center(
    //   //                           child: Text(
    //   //                             '2',
    //   //                             style: TextStyle(
    //   //                                 color: Colors.white, fontSize: 10.sp),
    //   //                           ),
    //   //                         ),
    //   //                       ),
    //   //                     )
    //   //                   ],
    //   //                 )
    //   //               ],
    //   //             )),
    //   //       );
    //   //     },
    //   //   ),
    //   // ),
    // );
  }
}
