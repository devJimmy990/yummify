import 'package:flutter/material.dart';
import 'package:yummify/core/constants/assets_manager.dart';

class AuthHeaderView extends StatelessWidget {
  const AuthHeaderView({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: MediaQuery.of(context).size.height * (.15),
    child: Center(child: Image.asset(AssetsManager.assetsLogo)),
  );
}
