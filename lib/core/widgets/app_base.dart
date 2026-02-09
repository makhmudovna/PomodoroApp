import 'package:flutter/material.dart';

/// Custom base scaffold widget
/// Barcha sahifalar uchun umumiy wrapper
class AppBase extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool showAppBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool resizeToAvoidBottomInset;
  final PreferredSizeWidget? appBar;

  const AppBase({
    super.key,
    this.child,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.showAppBar = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      appBar: appBar ?? (showAppBar && title != null
          ? AppBar(
              title: Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              leading: leading,
              actions: actions,
              backgroundColor: backgroundColor,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              foregroundColor: Colors.black,
            )
          : null),
      body: SafeArea(child: child ?? const SizedBox.shrink()),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}

/// AppBase without AppBar
class AppBaseNoAppBar extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;

  const AppBaseNoAppBar({
    super.key,
    required this.child,
    this.backgroundColor,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBase(
      showAppBar: false,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      child: child,
    );
  }
}