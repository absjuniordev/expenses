import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextField extends StatelessWidget {
  const AdaptativeTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.onSubimited,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final TextEditingController controller;
  final Function onSubimited;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubimited(),
              placeholder: label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubimited(),
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
