import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class TableBodyScreen extends StatefulWidget {
  final ScrollController scrollController;

  const TableBodyScreen({
    super.key,
    required this.scrollController,
  });

  @override
  State<TableBodyScreen> createState() => _TableBodyScreenState();
}

class _TableBodyScreenState extends State<TableBodyScreen> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  List dateTimeList = [
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
    '01 Aug \n2023',
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 2),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: ListView.builder(
              controller: _firstColumnController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemCount: dateTimeList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(dateTimeList[index]),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  controller: _restColumnsController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: List.generate(
                        20,
                        (index) => const Text('data'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
