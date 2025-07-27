import 'package:flutter/material.dart';

extension NavigatorManager on BuildContext {
  void namedNavigator(String routeName) => Navigator.pushNamed(this, routeName);

  void navigate(Widget route) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => route));

  void namedNavigatorWithReplacement(String routeName) =>
      Navigator.pushReplacementNamed(this, routeName);

  void navigateWithReplacement(Widget route) => Navigator.pushReplacement(
    this,
    MaterialPageRoute(builder: (context) => route),
  );
  void pop() => Navigator.pop(this);

  void namedPopUntil(String routeName) =>
      Navigator.popUntil(this, ModalRoute.withName(routeName));

  void namedPopUntilRoot() =>
      Navigator.popUntil(this, (route) => route.isFirst);
}
