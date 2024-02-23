import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
<<<<<<< HEAD
  const AdaptativeButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;
=======
  final String label;
  final Function() onPressed;

  const AdaptativeButton(
    this.label,
    this.onPressed, {
    Key? key,
  }) : super(key: key);
>>>>>>> 0bcd1dd9a5a586884bf6567545d82cdfc82b2f0b

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
             
            ),
          );
  }
}
