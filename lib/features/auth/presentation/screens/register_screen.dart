import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummify/core/extensions/navigator.dart';
import 'package:yummify/core/localization/localization.dart';
import 'package:yummify/core/routes/routes.dart';
import 'package:yummify/core/ui/buttons.dart';
import 'package:yummify/core/ui/inputs.dart';
import 'package:yummify/core/ui/toast.dart';
import 'package:yummify/core/validator/input.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/auth/presentation/widgets/auth_header.dart';
import 'package:yummify/features/auth/presentation/widgets/auth_switcher.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _name,
      _phone,
      _email,
      _password,
      _confirmPassword;

  @override
  void initState() {
    _name = TextEditingController();
    _phone = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ToastHelper.error(state.error);
          } else if (state is AccountCreated) {
            ToastHelper.success(Localization.authAccountCreatedSuccessfully);
            context.namedNavigatorWithReplacement(Routes.login);
          }
        },
        builder:
            (context, state) => SingleChildScrollView(
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
                                controller: _name,
                                icon: Icons.person_outlined,
                                label: Localization.authFullName,
                                validator: InputValidator.validateName,
                                hint: Localization.authEnterYourFullName,
                              ),
                              TextInputField(
                                controller: _phone,
                                icon: Icons.phone_android,
                                keyboardType: TextInputType.phone,
                                label: Localization.authPhoneNumber,
                                validator: InputValidator.validatePhone,
                                hint: Localization.authEnterYourPhoneNumber,
                              ),
                              TextInputField(
                                controller: _email,
                                icon: Icons.email_outlined,
                                label: Localization.authEmail,
                                hint: Localization.authEnterYourEmail,
                                validator: InputValidator.validateEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              PasswordInputField(
                                controller: _password,
                                label: Localization.authPassword,
                                hint: Localization.authEnterYourPassword,
                                validator: InputValidator.validatePassword,
                              ),
                              PasswordInputField(
                                controller: _confirmPassword,
                                hint: Localization.authConfirmPassword,
                                label: Localization.authConfirmPassword,
                                validator:
                                    (value) =>
                                        InputValidator.validateConfirmPassword(
                                          value,
                                          _password.text,
                                        ),
                              ),
                            ],
                          ),
                          state is AuthLoading
                              ? const CircularProgressIndicator()
                              : Column(
                                spacing: 18.h,
                                children: [
                                  Row(
                                    spacing: 25.w,
                                    children: [
                                      Expanded(
                                        child: Buttons.fill(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<AuthCubit>()
                                                  .register({
                                                    "password": _password.text,
                                                    "name":
                                                        _name.text
                                                            .trim()
                                                            .toLowerCase(),
                                                    "phone":
                                                        _phone.text
                                                            .trim()
                                                            .toLowerCase(),
                                                    "email":
                                                        _email.text
                                                            .trim()
                                                            .toLowerCase(),
                                                  });
                                            }
                                          },
                                          label: Localization.authSignUp,
                                        ),
                                      ),
                                      Expanded(
                                        child: Buttons.fill(
                                          onPressed: () {
                                            _name.text = "Jimmy";
                                            _phone.text = "01289223643";
                                            _email.text = "jimmy@gmail.com";
                                            _password.text = "12345678";
                                            _confirmPassword.text = "12345678";
                                          },
                                          label: "Fill Form",
                                        ),
                                      ),
                                    ],
                                  ),

                                  AuthAccountSwitcher(
                                    onPressed:
                                        () => context.namedNavigator(
                                          Routes.login,
                                        ),
                                    textButtonText: Localization.authLogIn,
                                    text: Localization.authAlreadyHaveAnAccount,
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    ),
  );
}
