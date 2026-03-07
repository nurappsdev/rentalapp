

import 'package:alora/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../controller/manage_sub_controller.dart';

class ManageSubScreen extends GetView<ManageSubController> {
  const ManageSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: const CustomAppBar(
        title:      'Manage Subscription',
        showBackBtn: true,
        elevation: 0.0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your  Plan',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.h),
            _PlanCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Update Payment button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Update Payment',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            // Cancel Subscription button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const _CancelReasonDialog(),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Text(
                  'Cancel Subscription',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main card with orange border
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all( color: Color(0xFFFF8A4D),width: 1.5),
          ),
          child: Column(
            children: [
              // Units
              Text(
                '1-3 Units',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 8.h),

              // Price
              Text(
                r'$20.00',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color:  Color(0xFFFF8A4D),
                ),
              ),
              SizedBox(height: 8.h),

              // Renewal date
              Text(
                'Renewal Date: Jun 26, 2025',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 16.h),

              // Change Plan button
              SizedBox(
                width: double.infinity,
                height: 46.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.selectSubscription);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4AB8E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Change Plan',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ✅ "Deluxe" badge on top center
        Positioned(
          top: -16.h,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Color(0xFFFF8A4D),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFFFF8A4D), width: 1.5),
              ),
              child: Text(
                'Deluxe',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class _CancelReasonDialog extends StatefulWidget {
const _CancelReasonDialog();

@override
State<_CancelReasonDialog> createState() => _CancelReasonDialogState();
}

class _CancelReasonDialogState extends State<_CancelReasonDialog> {
final TextEditingController _controller = TextEditingController();

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Dialog(
backgroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16.r),
),
child: Padding(
padding: EdgeInsets.all(20.r),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
// Title
Text(
'Why Did They Cancel As Well !',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 15.sp,
fontWeight: FontWeight.w700,
color: Colors.black87,
),
),

SizedBox(height: 16.h),

// Comment box
Container(
width: double.infinity,
height: 100.h,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(10.r),
border: Border.all(color: const Color(0xFFE0E0E0)),
),
child: TextField(
controller: _controller,
maxLines: null,
expands: true,
textAlignVertical: TextAlignVertical.top,
style: TextStyle(fontSize: 13.sp, color: Colors.black87),
decoration: InputDecoration(
hintText: 'Add a Comment...',
hintStyle: TextStyle(
fontSize: 13.sp,
color: Colors.grey.shade400,
),
border: InputBorder.none,
contentPadding: EdgeInsets.all(12.r),
),
),
),

SizedBox(height: 16.h),

// Buttons row
Row(
children: [
// No button
Expanded(
child: SizedBox(
height: 46.h,
child: OutlinedButton(
onPressed: () => Navigator.pop(context),
style: OutlinedButton.styleFrom(
side: const BorderSide(
color: Color(0xFF4AB8E8),
width: 1.5,
),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16.r),
),
),
child: Text(
'No',
style: TextStyle(
fontSize: 15.sp,
fontWeight: FontWeight.w600,
color: Colors.black87,
),
),
),
),
),

SizedBox(width: 12.w),

// Yes button
Expanded(
child: SizedBox(
height: 46.h,
child: ElevatedButton(
onPressed: () => Navigator.pop(context),
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF4AB8E8),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(16.r),
),
elevation: 0,
),
child: Text(
'Yes',
style: TextStyle(
fontSize: 15.sp,
fontWeight: FontWeight.w600,
color: Colors.white,
),
),
),
),
),
],
),
],
),
),
);
}
}