import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/asset_image_frame.dart';
import 'package:flutter_tutorial/components/decoration_image_frame.dart';
import 'package:flutter_tutorial/components/network_image_frame.dart';
import 'package:flutter_tutorial/utils/images.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: const Icon(Icons.arrow_back),
          // ),
          backgroundColor: Colors.cyan,
          title: const Text('Sign in'),
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DecoRationImageFrame(),
                DecoRationImageFrame(),
                DecoRationImageFrame(),
                DecoRationImageFrame(),
                AssetImageFrame(src: Images.login),
                NetworkImageFrame(
                  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
                  // height: 200,
                ),
                NetworkImageFrame(
                  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
                ),
                NetworkImageFrame(
                  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
                ),
                NetworkImageFrame(
                  'https://rukminim2.flixcart.com/fk-p-flap/1100/500/image/97f24748652e61ae.png?q=20',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
