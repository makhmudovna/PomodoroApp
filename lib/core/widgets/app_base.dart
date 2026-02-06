import 'package:flutter/material.dart';

class AppBase extends StatefulWidget {
  final Widget? child;
  final String? title;
  final Widget? icon;
  const AppBase({super.key, this.child, this.title, this.icon});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? ''), leading: widget.icon),
      body: widget.child,
    );
  }
}
// TODO: 
// 1)Ушбу виджетни кандай клиб асос(бошка виджетлар (page) лар) устидан тарикасида 
// ишлатилнади. 
// 2) Параметрлар очилиши ва уларга киймат бериш.
// 3) Ушбу юкоридаги код асосида параметрлар тайплар хакида тушунча.
// 4) Параметрни кандай тогри очилади тушунча.