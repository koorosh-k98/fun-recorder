import 'package:flutter/material.dart';
import 'package:recorder/views/widgets/custom_button.dart';

@immutable
class CustomAlertDialog<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;

  const CustomAlertDialog({
    required this.title,
    required this.message,
    required this.buttons,
  });
}

extension Present<T> on CustomAlertDialog<T> {
  Future<T?> present(BuildContext context) {
    return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.warning_rounded,
            size: 40,
            color: Colors.amber,),
          actionsAlignment: MainAxisAlignment.center,
          title: Text(title),
          content: Text(message),
          actions: buttons.entries.map(
                (entry) {
              return CustomButton(
                color: entry.value==true?Colors.green:Colors.red,
                child: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop(
                    entry.value,
                  );
                },
              );
            },
          ).toList(),
        );
      },
    );
  }
}
