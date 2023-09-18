import 'package:flutter/material.dart';

const double cellWidth = 0;

class BranchTableCell extends StatelessWidget {
  final String value;
  final Color color;

  final double cellWidth;
  final double cellheight;

  const BranchTableCell(
      {super.key,
      required this.value,
      required this.cellWidth,
      required this.cellheight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellheight,
      // color: Colors.green,
      decoration: const BoxDecoration(
          // border: Border.all(
          //   color: Colors.black12,
          //   width: 1.0,
          // ),

          ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
            fontSize: 12.0, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
