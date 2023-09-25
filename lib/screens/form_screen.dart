import 'dart:developer';

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  String? priceError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppTextField(
              labelText: 'Product name',
              errorText: 'Product name is required',
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
