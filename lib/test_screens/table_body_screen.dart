import 'package:flutter/material.dart';
import 'package:flutter_tutorial/test_screens/sticky.dart';
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
    'Total'
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 0 || notification.depth == 1;
      },
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
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

List<String> dateTimeList = [
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  '01 Aug \n2023',
  'Total'
];

List<CityCell> cities = [
  CityCell(name: 'Mumbai', center: ['Borivalli', 'HO center']),
  CityCell(name: 'Chennai', center: ['Chennai']),
  CityCell(name: 'Delhi NCR', center: ['DLF Phase4', 'NCR']),
  CityCell(name: 'Ahemdabad', center: ['CJ Road', 'Bopal']),
];

class YourApp extends StatefulWidget {
  const YourApp({super.key});

  @override
  State<YourApp> createState() => _YourAppState();
}

class _YourAppState extends State<YourApp> {
  List<String> mainCity = [];
  List<String> mainCenter = [];
  @override
  void initState() {
    for (CityCell e in cities) {
      mainCity.add(e.name);
      for (int i = 0; i < e.center.length; i++) {
        mainCenter.add(e.center[i]);
        if (i != 0) mainCity.add('');
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Grid Example'),
      ),
      body: StickyTable(
        columnsLength: mainCenter.length,
        rowsLength: dateTimeList.length,
        columnsTitleBuilder: (i) => Column(
          children: [
            Expanded(child: Center(child: Text(mainCity[i]))),
            Padding(
              padding: EdgeInsets.only(
                  right: i + 1 == mainCity.length
                      ? 0
                      : (mainCity[i + 1] != '' ? 2 : 0)),
              child: const Divider(color: Colors.black),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(mainCenter[i]),
              ),
            ),
            // Spacer(),
            const Divider(color: Colors.black),
          ],
        ),
        rowsTitleBuilder: (i) => Text(dateTimeList[i]),
        contentCellBuilder: (i, j) => Text('${i + j}'),
        legendCell: const Column(
          children: [
            Expanded(child: Center(child: Text('Date'))),
            Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class CityCell {
  final String name;
  final List<String> center;

  CityCell({required this.name, required this.center});
}
