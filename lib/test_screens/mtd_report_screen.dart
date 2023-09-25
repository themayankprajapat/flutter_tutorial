import 'package:flutter/material.dart';
import 'package:flutter_tutorial/test_screens/table_body_screen.dart';
import 'package:flutter_tutorial/test_screens/table_head_screen.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
          padding: const EdgeInsets.only(left: 15.0, top: 8.0),
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

class Employee {
  Employee(
    this.id,
    this.name,
    this.designation,
    this.salary,
    this.first,
    this.second,
  );
  final int id;
  final String name;
  final String designation;
  final int salary;
  final int first;
  final int second;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<CityCell> employees}) {
    _employees = employees
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              const DataGridCell<String>(columnName: 'id', value: 'Date'),
              ...List.generate(
                cities.length,
                (index) => DataGridCell(
                  columnName: cities[index].center[0],
                  value: cities[index].center[0],
                ),
              )
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}

class YO extends StatefulWidget {
  const YO({super.key});

  @override
  State<YO> createState() => _YOState();
}

class _YOState extends State<YO> {
  List<CityCell> employees = <CityCell>[];

  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployees();
    employeeDataSource = EmployeeDataSource(employees: employees);
  }

  List<CityCell> getEmployees() {
    return [
      CityCell(name: 'Mumbai', center: ['Borivalli', 'HO center']),
      CityCell(name: 'Chennai', center: ['Chennai ESTZ']),
      CityCell(name: 'Delhi NCR', center: ['DLF Phase4', 'NCR']),
      CityCell(name: 'Ahemdabad', center: ['CJ Road', 'Bopal']),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfDataGrid(
          gridLinesVisibility: GridLinesVisibility.none,
          frozenColumnsCount: 1,
          frozenRowsCount: 1,
          headerGridLinesVisibility: GridLinesVisibility.none,
          source: employeeDataSource,
          columns: <GridColumn>[
            GridColumn(
              columnName: 'id',
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.bottomCenter,
                child: const Text(''),
              ),
            ),
            GridColumn(
              columnName: 'name',
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text('Name'),
              ),
            ),
            GridColumn(
              columnName: 'designation',
              width: 120,
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text('Designation'),
              ),
            ),
            GridColumn(
              columnName: 'salary',
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text('Salary'),
              ),
            ),
            GridColumn(
              columnName: 'salary',
              label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text('Salary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
