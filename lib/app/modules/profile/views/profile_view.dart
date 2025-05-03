import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.r),
            ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Moeed Maqsood',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'moeed366@gmail.com',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '93-94943459',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.settings, size: 24.sp),
                  title: Text(
                    'Setting',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.payment, size: 24.sp),
                  title: Text(
                    'Wallet',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.support, size: 24.sp),
                  title: Text(
                    'Support',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  onTap: () {},
                ),
              ]

            ),
          ),


        ],
      ),

    );
  }
}