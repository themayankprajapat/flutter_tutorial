import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Sliver Screen')),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // title: const Text('Sliver Screen'),
              flexibleSpace: Container(color: Colors.amber),
              collapsedHeight: 100,
              expandedHeight: 200,
              floating: true,
              pinned: true,
              snap: true,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Missed Calls'),
              ),
            ),
            // SliverList.builder(
            //   itemCount: 15,
            //   itemBuilder: (context, index) => const ListTile(
            //     // enabled: false,
            //     selectedTileColor: Colors.orange,
            //     selectedColor: Colors.black,
            //     // selected: true,
            //     style: ListTileStyle.list,
            //     tileColor: Colors.white,
            //     leading: Icon(Icons.call),
            //     title: Text('Mayank'),
            //     subtitle: Text('5 mins ago'),
            //     trailing: Text('Missed'),
            //   ),
            // )

            // SliverFixedExtentList(
            //   delegate: SliverChildListDelegate(
            //     List.generate(20, (index) => Text('Index $index')),
            //   ),
            //   itemExtent: 200,
            // )
            SliverPadding(
              padding: const EdgeInsets.all(30),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    color: Color.fromARGB((index + 1) * 10, 100, 200, 255),
                    alignment: Alignment.center,
                    child: Text('$index'),
                  ),
                  childCount: 20,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // childAspectRatio: 2 / 3,
                  // mainAxisExtent: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
