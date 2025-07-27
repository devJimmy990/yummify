import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/auth/data/model/user.dart';
import 'package:yummify/features/profile/screens/edit_profile_screen.dart';

class ProfileAuthenticationMode extends StatelessWidget {
  const ProfileAuthenticationMode(this.user, {super.key});
  final User user;

  @override
  Widget build(BuildContext context) {
    final String initials =
        user.name.isNotEmpty
            ? user.name.trim().split(' ').take(2).map((e) => e[0]).join()
            : 'U';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          // Avatar
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.grey.shade300,
            backgroundImage:
                user.avatar != null ? NetworkImage(user.avatar!) : null,
            child:
                user.avatar == null
                    ? Text(
                      initials.toUpperCase(),
                      style: TextStyle(fontSize: 24.sp, color: Colors.white),
                    )
                    : null,
          ),
          SizedBox(height: 12.h),

          // Info
          Text(user.name, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 4.h),
          Text(user.email),
          SizedBox(height: 4.h),
          Text(user.phone),
          SizedBox(height: 24.h),

          // Quick Access Cards
          _buildTile(
            context,
            icon: Icons.edit,
            title: Localization.profileEditProfile,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(user: user),
                  ),
                ),
          ),

          _buildTile(
            context,
            icon: Icons.receipt_long,
            title: Localization.profileMyOrders,
            onTap: () => context.namedNavigator(Routes.orders),
          ),
          _buildTile(
            context,
            icon: Icons.store,
            title: Localization.profileContinueShopping,
            onTap: () => context.namedNavigator(Routes.allMeals),
          ),

          const Divider(height: 32),

          _buildTile(
            context,
            icon: Icons.settings,
            title: Localization.profileSettings,
            onTap: () => context.namedNavigator(Routes.settings),
          ),
          _buildTile(
            context,
            icon: Icons.help_outline,
            title: Localization.profileFaq,
            onTap: () {},
          ),
          _buildTile(
            context,
            icon: Icons.mail_outline,
            title: Localization.profileContactUs,
            onTap: () => context.namedNavigator(Routes.contact),
          ),

          const Divider(height: 32),

          _buildTile(
            context,
            icon: Icons.logout,
            title: Localization.profileLogOut,
            onTap: () {
              context.read<AuthCubit>().logout();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) => ListTile(
    leading: Icon(icon, color: color ?? Theme.of(context).iconTheme.color),
    title: Text(title),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: onTap,
  );
}
