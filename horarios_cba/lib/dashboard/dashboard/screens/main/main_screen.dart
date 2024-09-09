import 'package:flutter/material.dart';
import 'package:horarios_cba/dashboard/controllers/MenuAppController.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:horarios_cba/responsive.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

// División por partes de los elementos principales del dashboard

class MainScreenTodo extends StatefulWidget {

  const MainScreenTodo({super.key});

  @override
  State<MainScreenTodo> createState() => _MainScreenTodoState();
}

class _MainScreenTodoState extends State<MainScreenTodo> {


  _MainScreenTodoState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
