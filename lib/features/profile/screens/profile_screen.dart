import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/core/ui/toast.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/profile/views/profile_authentication_mode.dart';
import 'package:yummify/features/profile/views/profile_guest_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ToastHelper.error(state.error);
          } else if (state is Unauthenticated) {
            context.namedNavigator(Routes.login);
          }
        },
        builder: (context, state) {
          if (state is Authenticated) {
            return ProfileAuthenticationMode(state.user);
          } else {
            return const ProfileGuestMode();
          }
        },
      ),
    ),
  );
}
