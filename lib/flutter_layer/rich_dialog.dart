import 'package:flutter/material.dart';

class RichDialog extends StatelessWidget {
  const RichDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Congratulations! You are rich!'),
      actions: [
        TextButton(
          child: const Text('buy jet fuel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('save in treasure chest'))
      ],
    );
  }
}
