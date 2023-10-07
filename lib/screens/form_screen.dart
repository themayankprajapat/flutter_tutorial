import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? priceError;

  File? image;

  List<File> imageList = [];

  void pick(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        log(pickedFile.path, name: 'pickedFile');
        final iamgeFile = File(pickedFile.path);
        debugPrint('$iamgeFile imageFile');
        final appDir = await getApplicationDocumentsDirectory();
        final filePath = appDir.path;
        final fileName = iamgeFile.path.split('/').last;

        final savedFile = await iamgeFile.copy('$filePath/$fileName');
        debugPrint('$filePath filePath');
        debugPrint('$savedFile savedFile');

        setState(() {
          image = savedFile;
        });
        // final base64 = base64Encode(await pickedFile.readAsBytes());
        // log(base64, name: 'base64 string');
      }
    } catch (e) {
      debugPrint('${e}ImagePicker Error');
    }
  }

  void pickMultiImage() async {
    final picker = ImagePicker();
    List<File> imageFiles = [];
    final pickedFiles = await picker.pickMultiImage();
    for (XFile e in pickedFiles) {
      imageFiles.add(File(e.path));
    }
    setState(() {
      imageList.addAll(imageFiles);
    });
  }

  bool scale = false;

  final widgetKey = GlobalKey<_AppTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: math.pi / 4,
                    child: const Text('Something '),
                  ),
                  // SizedBox(width: 20),
                  const VerticalDivider(),
                  const Text(' Place'),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Wrap(
              children: List.generate(
                imageList.length + 1,
                (index) => index == imageList.length
                    ? GestureDetector(
                        onTap: () {
                          pick(ImageSource.camera);
                        },
                        child: Transform.scale(
                          scaleX: scale ? 2 : 1,
                          scaleY: scale ? 3 : 1,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 80,
                            width: 80,
                            color: const Color.fromARGB(144, 68, 137, 255),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.file(
                          imageList[index],
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                      ),
              ),
            ),
            // GestureDetector(
            //   onTap: () => pick(ImageSource.camera),
            //   child: Container(
            //     height: 200,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       color: const Color.fromARGB(144, 68, 137, 255),
            //       image: image == null
            //           ? null
            //           : DecorationImage(
            //               image: FileImage(image!),
            //               fit: BoxFit.cover,
            //             ),
            //     ),
            //     child: image == null ? const Icon(Icons.add) : null,
            //   ),
            // ),
            const AppTextField(
              labelText: 'Product name',
              errorText: 'Product name is required',
            ),
            AppTextField(
              key: widgetKey,
              labelText: 'Product price',
              errorText: 'Product price is required',
              customError: priceError,
              onChanged: (value) {
                final val = int.tryParse(value);

                priceError = val == null ? 'Entered price is invalid' : null;

                setState(() {});
              },
            ),
            const AppTextField(
              labelText: 'Product Description',
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  scale = !scale;
                });
                // widgetKey.currentState?.myMethod();
                // if (_formKey.currentState!.validate()) {
                //   log('Prodct Added');
                // }
              },
              child: const Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    this.margin,
    this.controller,
    this.errorText,
    this.customError,
    this.onChanged,
    this.onTap,
  });
  final TextEditingController? controller;
  final String labelText;
  final EdgeInsetsGeometry? margin;
  final String? errorText;
  final String? customError;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  void myMethod() {
    change = !change;
    setState(() {});
  }

  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.all(20),
      child: TextFormField(
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errorText;
          }
          return widget.customError;
        },
        decoration: InputDecoration(
          // icon: Icon(Icons.abc),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: change ? Colors.amber : Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: change ? Colors.amber : Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
