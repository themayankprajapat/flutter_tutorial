import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimationScreen extends ConsumerStatefulWidget {
  const AnimationScreen({super.key});

  @override
  ConsumerState<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends ConsumerState<AnimationScreen>
    with TickerProviderStateMixin {
  bool isLoading = true;

  late String myValue;

  late AnimationController controller;
  // late Animation<Color?> _colorAnimation;
  // late Animation<double> _sizeAnimation;

  late Animation<double> _sizeAnimation;
  late Animation<double> _positionAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _paddingAnimation;
  bool like = false;
  int counter = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _sizeAnimation = Tween<double>(begin: 80, end: 200).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.25)));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.75, 1)));
    _paddingAnimation = Tween<double>(begin: 30, end: 0).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.75, 1)));
    _positionAnimation = Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.50)));
    // final curve = CurvedAnimation(
    //     parent: controller,
    //     curve: const Interval(0.0, 0.5, curve: Curves.easeInOut));
    // _colorAnimation =
    //     ColorTween(begin: Colors.grey, end: Colors.red).animate(curve);

    // _sizeAnimation = TweenSequence<double>([
    //   TweenSequenceItem(tween: Tween<double>(begin: 50, end: 70), weight: 50),
    //   TweenSequenceItem(tween: Tween<double>(begin: 70, end: 50), weight: 100),
    // ]).animate(curve);

    // _sizeAnimation = Tween<double>(begin: 50, end: 70).animate(CurvedAnimation(
    //     parent: controller,
    //     curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));

    // controller.addListener(() {
    //   log(_colorAnimation.value.toString(), name: 'listner');
    // });
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     like = true;
    //     setState(() {});
    //   } else if (status == AnimationStatus.dismissed) {
    //     like = false;
    //     setState(() {});
    //   }
    // });
    super.initState();
    // _loadItems();
  }

  // final _fetchedItems = [1, 2, 3, 4, 5, 6, 7];

  // Future<void> _loadItems() async {
  //   for (int item in _fetchedItems) {
  //     // 1) Wait for one second
  //     await Future.delayed(const Duration(milliseconds: 100));
  //     // 2) Adding data to actual variable that holds the item.
  //     _items.add(item);
  //     // 3) Telling animated list to start animation
  //     listKey.currentState?.insertItem(_items.length - 1);
  //   }
  // }

  // List<int> _items = [];
  // final listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation')),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     listKey.currentState?.insertItem(_items.length,
      //         duration: const Duration(milliseconds: 100));
      //     _items = [..._items, counter++];
      //     setState(() {});
      //     // controller.stop();
      //   },
      //   child: const Text('NEW'),
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    controller.forward();
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: _sizeAnimation.value,
                    width: 80 + (_sizeAnimation.value / 4),
                    color: Colors.orange,
                    child: Container(
                      height: _positionAnimation.value,
                      width: 80 + (_sizeAnimation.value / 4),
                      color: Colors.blueGrey,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: _paddingAnimation.value),
                        child: Text(
                          'Yup',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Colors.white.withOpacity(_fadeAnimation.value),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      // AnimatedList(
      //   key: listKey,
      //   initialItemCount: _items.length,
      //   itemBuilder: (context, index, animation) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: SlideTransition(
      //         position: Tween<Offset>(
      //                 begin: const Offset(1, 0), end: const Offset(0, 0))
      //             .animate(animation),
      //         child: Container(
      //           width: 400,
      //           height: 50,
      //           color: Colors.amber,
      //           child: Text('data ${index + 1}'),
      //         ),
      //       ),
      //     );
      //   },
      // )

      //  Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           // ScaleTransition(
      //           //   scale: _animation,
      //           //   child: const CircleAvatar(
      //           //     radius: 100,
      //           //     backgroundImage: AssetImage(Images.login),
      //           //   ),
      //           // ),

      //           AnimatedBuilder(
      //             animation: _colorAnimation,
      //             builder: (BuildContext context, Widget? child) {
      //               return IconButton(
      //                 onPressed: () {
      //                   like ? controller.reverse() : controller.forward();
      //                 },
      //                 icon: Icon(
      //                   Icons.favorite,
      //                   color: _colorAnimation.value,
      //                   size: _sizeAnimation.value,
      //                 ),
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
