import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recorder/states/recorded_list/extensions/file_name.dart';
import 'package:recorder/views/widgets/custom_button.dart';

import '../constants/strings.dart';

@immutable
class RenameDialog<T> {
  final String title;
  final FileSystemEntity file;
  final Map<String, T> buttons;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RenameDialog({
    required this.title,
    required this.buttons,
    required this.file,
  });
}

extension Present<T> on RenameDialog<T> {
  Future<T?> present(BuildContext context) {
    _controller.text = file.path.fileName().split(".").first;
    return showDialog<T?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.edit,
            size: 40,
            color: Colors.amber,
          ),
          actionsAlignment: MainAxisAlignment.center,
          title: Text(title),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              maxLength: 30,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffix: const Text(Strings.m4a),
              ),
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter file name";
                } else if (value.contains(".")) {
                  return "File name shouldn't contain '.'";
                }
                return null;
              },
              onFieldSubmitted: (value) => validateForm(value),
            ),
          ),
          actions: buttons.entries.map(
            (entry) {
              return CustomButton(
                color: entry.value == true ? Colors.green : Colors.red,
                child: Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (entry.value == true) {
                    if (validateForm(_controller.text)) {
                      Navigator.of(context).pop(entry.value);
                    }
                  } else {
                    Navigator.of(context).pop(entry.value);
                  }
                },
              );
            },
          ).toList(),
        );
      },
    );
  }

  bool validateForm(value) {
    if (_formKey.currentState!.validate()) {
      var path = file.path;
      var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
      var newPath = "${path.substring(0, lastSeparator + 1) + value}.m4a";
      file.rename(newPath);
      return true;
    }
    return false;
  }
}
