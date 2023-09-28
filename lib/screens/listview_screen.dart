import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/list_screen.dart';
import 'package:flutter_tutorial/utils/utils.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Map<String, dynamic>> list = [];

  int myOffset = 0;
  int myLimit = 20;
  bool paginate = true;

  Future<void> getList() async {
    if (!paginate) return;
    setState(() {
      loader = true;
    });
    await getData(offset: myOffset, limit: myLimit).then((value) {
      list += value;
      myOffset = myOffset + 20;
      myLimit = myLimit + 20;

      if (value.length < 20) paginate = false;
      loader = false;
      setState(() {});
    });
  }

  Future<List<Map<String, dynamic>>> getData({
    int limit = 20,
    int offset = 0,
  }) async {
    log(offset.toString(), name: 'offset');
    await Future.delayed(const Duration(seconds: 2));
    final myList = myImages.getRange(offset, limit).toList();
    await Future.delayed(const Duration(seconds: 2));
    log(myList.length.toString(), name: 'myList');

    return myList;
  }

  bool loader = false;

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lists")),
      body: Scrollbar(
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.left,
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 12,
        child: NotificationListener(
          onNotification: (notification) =>
              Utils.scrollNotifier(notification, getList),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('My listview'),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  itemCount: list.length + (loader ? 1 : 0),
                  separatorBuilder: (context, index) =>
                      Container(color: Colors.amber, height: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return index == list.length
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(list[index]['name']),
                                Text(list[index]['age'].toString()),
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
