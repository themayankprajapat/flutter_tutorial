import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int currentIndex = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          controller.animateToPage(
            value,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page1'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page2'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page3'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Page4'),
        ],
      ),
      body: PageView(
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        controller: controller,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: const Text(
                  'Page 1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.width,
                // width: 200,
                child: PageView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blueAccent,
                      child: const Text(
                        'Image 1',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: const Text(
                        'Image 2',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: const Text(
                        'Image 3',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      child: const Text(
                        'Image 4',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.green,
            child: const Text(
              'Page 2',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text(
              'Page 3',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.brown,
            child: const Text(
              'Page 4',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}


// Rotated Box
//  Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(child: Container(color: Colors.blueAccent)),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(child: Container(height: 30, color: Colors.green)),
//                 Container(
//                   color: Colors.amber,
//                   child: const RotatedBox(
//                     quarterTurns: 3,
//                     child: Text(
//                       'Something',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Container(height: 30, color: Colors.red)),
//               ],
//             ),
//             Expanded(child: Container(color: Colors.brown)),
//           ],
//         ),
//       ),