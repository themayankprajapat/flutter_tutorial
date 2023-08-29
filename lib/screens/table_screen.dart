import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Table Widget')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            color: Colors.amberAccent,
            child: Table(
              // defaultColumnWidth: FixedColumnWidth(60),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              // columnWidths: const {
              //   // 0: IntrinsicColumnWidth(),
              //   // 1: FlexColumnWidth(),
              //   2: MaxColumnWidth(FixedColumnWidth(20), FixedColumnWidth(100))
              //   // 3: FixedColumnWidth(50),
              // },
              border: TableBorder.all(),
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: Colors.blue),
                  children: [
                    TableCell(
                      child: Container(
                          color: Colors.red,
                          height: 200,
                          child: const Text('data')),
                    ),
                    const Text('data1'),
                    const Text('data1'),
                    const Text('data1'),
                    const Text('data1'),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCell(child: Text('data')),
                    Text('data2'),
                    Text('data2'),
                    Text('data2'),
                    Text('data2'),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCell(child: Text('data')),
                    Text('data3'),
                    Text('data3'),
                    Text('data3'),
                    Text('data3'),
                  ],
                ),
                const TableRow(
                  children: [
                    TableCell(child: Text('data')),
                    Text('data4'),
                    Text('data4'),
                    Text('data4'),
                    Text('data4'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
