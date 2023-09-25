import 'package:flutter/material.dart';

class TableHead extends StatefulWidget {
  final ScrollController scrollController;

  const TableHead({
    super.key,
    required this.scrollController,
  });

  @override
  State<TableHead> createState() => _TableHeadState();
}

class _TableHeadState extends State<TableHead> {
  List<String> city = ['Mumbai', 'CHENNAI', 'DELHI'];

  List<Map<String, dynamic>> branchData = [
    {
      'branchLocation': 'MUMBAI',
      'branchCenter': ['Boravila', 'HO Centre'],
      'data': {
        'borivila': [16, 6, 0, 0, 0, 0, 0, 0],
        'Ho center': [12, 9, 0, 0, 0, 0, 0, 0]
      }
    },
    {
      'branchLocation': 'CHENNAI',
      'branchCenter': ['Chennai'],
      'data': {
        'chennai': [16, 6, 0, 0, 0, 0, 0, 0],
      }
    },
    {
      'branchLocation': 'DELHI\nNCR',
      'branchCenter': ['DLF\nPhase4'],
      'data': {
        'DLF\nPhase4': [16, 6, 0, 0, 0, 0, 0, 0],
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Date',
            style: TextStyle(
              color: Color(0XFF00356A),
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: branchData.length,
              itemBuilder: (context, index) {
                final branchLocation = branchData[index]['branchLocation'];
                List<String> branchCenter = branchData[index]['branchCenter'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 35,
                      child: Text(
                        branchLocation,
                        style: const TextStyle(
                            color: Color(0XFF00356A),
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: branchCenter
                          .map(
                            (center) => Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                center,
                                style: const TextStyle(
                                  color: Color(0XFF00356A),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
