import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/routes/routes.dart';

class ProfileGuestMode extends StatelessWidget {
  const ProfileGuestMode({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_outline, size: 100, color: Colors.grey),
          SizedBox(height: 24.h),
          Text(
            Localization.profileWelcomeGuest,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 12.h),
          Text(
            Localization.profileLogInToViewYourProfileOrdersAndCart,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 24.h),
          ElevatedButton.icon(
            onPressed: () {
              context.namedNavigator(Routes.login);
            },
            icon: const Icon(Icons.login),
            label: Text(Localization.authLogIn),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
            ),
          ),
        ],
      ),
    ),
  );
}
