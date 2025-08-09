import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionScreen extends StatelessWidget {
  static const routeName = 'TermsConditionScreen';
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations. A blunt cut bob is a shorter hairstyle that\'s cut into a straight line at the ends. Bobs have proven themselves to be transcending of time with its endless variations.')
            ],
          ),
        ),
      ),
    );
  }
}
