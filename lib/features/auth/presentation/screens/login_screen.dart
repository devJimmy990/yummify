import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/core/ui/buttons.dart';
import 'package:yummify/core/ui/inputs.dart';
import 'package:yummify/core/ui/toast.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/auth/presentation/widgets/auth_header.dart';
import 'package:yummify/features/auth/presentation/widgets/auth_switcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email, _password;

  @override
  void initState() {
    _password = TextEditingController();
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ToastHelper.error(state.error);
          } else if (state is Authenticated) {
            context.namedNavigatorWithReplacement(Routes.main);
          } else if (state is AccountCreated) {
            _email.text = state.email;
            _password.text = state.password;
          }
        },
        builder: (context, state) {
          if (state is AccountCreated) {
            _email.text = state.email;
            _password.text = state.password;
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const AuthHeaderView(),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 25.h,
                      children: [
                        Column(
                          spacing: 10.h,
                          children: [
                            TextInputField(
                              controller: _email,
                              icon: Icons.person,
                              label: Localization.authEmail,
                              hint: Localization.authEnterYourEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            PasswordInputField(
                              label: Localization.authPassword,
                              hint: Localization.authEnterYourPassword,
                              controller: _password,
                            ),
                          ],
                        ),
                        state is AuthLoading
                            ? const CircularProgressIndicator()
                            : Column(
                              spacing: 18.h,
                              children: [
                                Row(
                                  spacing: 15.w,
                                  children: [
                                    Expanded(
                                      child: Buttons.fill(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<AuthCubit>().login(
                                              email: _email.text,
                                              password: _password.text,
                                            );
                                          }
                                        },
                                        label: Localization.authLogIn,
                                      ),
                                    ),
                                    Expanded(
                                      child: Buttons.fill(
                                        onPressed: () {
                                          _email.text = "jimmy@gmail.com";
                                          _password.text = "12345678";
                                        },
                                        label: "Fill Form",
                                      ),
                                    ),
                                  ],
                                ),
                                AuthAccountSwitcher(
                                  text: Localization.authNoAccount,
                                  textButtonText: Localization.authSignUp,
                                  onPressed:
                                      () => context.namedNavigator(
                                        Routes.register,
                                      ),
                                ),
                              ],
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
