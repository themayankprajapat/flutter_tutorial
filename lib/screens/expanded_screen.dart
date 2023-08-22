import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Expanded')),
        body: const Column(
          children: [
            Text('Without Expanded'),
            // SizedBox(
            //   height: 120,
            //   child: Row(
            //     children: [
            //       // Expanded(child: AssetImageFrame(src: Images.login)),
            //       // Expanded(child: AssetImageFrame(src: Images.login)),
            //       // Expanded(child: AssetImageFrame(src: Images.login)),
            //     ],
            //   ),
            // ),
            ExpandCon(val: Colors.amber),
            ExpandCon(val: Colors.red),
            ExpandCon(val: Colors.green),
          ],
        ),
      ),
    );
  }
}

class ExpandCon extends StatelessWidget {
  const ExpandCon({super.key, required this.val});
  final Color val;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: val));
  }
}
