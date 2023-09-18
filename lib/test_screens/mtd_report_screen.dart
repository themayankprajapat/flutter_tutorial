import 'package:flutter/material.dart';
import 'package:flutter_tutorial/test_screens/table_body_screen.dart';
import 'package:flutter_tutorial/test_screens/table_head_screen.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class MtdReportScreen extends StatefulWidget {
  const MtdReportScreen({super.key});

  @override
  State<MtdReportScreen> createState() => _MtdReportScreenState();
}

class _MtdReportScreenState extends State<MtdReportScreen> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _bodyController;
  late ScrollController _headController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 8.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableHead(scrollController: _headController),
              const Divider(thickness: 1, color: Colors.black),
              Expanded(
                child: TableBodyScreen(scrollController: _bodyController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
