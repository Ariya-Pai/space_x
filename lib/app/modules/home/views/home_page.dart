import 'package:flutter/material.dart';
import 'package:space_x/core/utils/widgets/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
