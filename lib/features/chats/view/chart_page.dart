import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safetalk/helpers/constants/color.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> helpers = [
      "hiiii",
      "hiitei",
      "hiweiii",
      "hiiwefii",
      "hiiwefii",
      "hiiwei",
      "hiiaefii",
      "hiiwwqfii",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.builder(
        itemCount: helpers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
                padding: EdgeInsets.all(8.r),
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0XFF4242FE).withOpacity(0.25),
                      offset: const Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/logo/minh-pham-HI6gy-p-WBI-unsplash(1).jpg',
                            width: 48.h,
                            height: 48.h,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "name",
                              style: TextStyle(
                                  fontFamily: "Poppins-SemiBold",
                                  fontSize: 14.sp),
                            ),
                            Text(
                              'message',
                              style: TextStyle(
                                  fontFamily: "Poppins-Regular",
                                  fontSize: 12.sp,
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Container(
                            height: 20.h,
                            width: 20.h,
                            color: secondaryColor,
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
