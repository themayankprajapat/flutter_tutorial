import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
        log(iamgeFile.toString(), name: 'imageFile');
        setState(() {
          image = iamgeFile;
        });
        // final base64 = base64Encode(await pickedFile.readAsBytes());
        // log(base64, name: 'base64 string');
      }
    } catch (e) {
      log(e.toString(), name: 'ImagePicker Error');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: List.generate(
                imageList.length + 1,
                (index) => index == imageList.length
                    ? GestureDetector(
                        onTap: pickMultiImage,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 80,
                          width: 80,
                          color: const Color.fromARGB(144, 68, 137, 255),
                          child: const Icon(Icons.add),
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
                if (_formKey.currentState!.validate()) {
                  log('Prodct Added');
                }
              },
              child: const Text('ADD'),
            )
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(20),
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return errorText;
          }
          return customError;
        },
        decoration: InputDecoration(
          // icon: Icon(Icons.abc),
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
