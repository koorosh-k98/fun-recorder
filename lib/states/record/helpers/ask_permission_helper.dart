import 'package:flutter/foundation.dart' show immutable;
import 'package:permission_handler/permission_handler.dart';

@immutable
class AskPermissionHelper {
  static Future<bool> askStorageAndMicrophonePermission() async {
    PermissionStatus permissionStatusStorage =
        await Permission.storage.request();
    if (permissionStatusStorage != PermissionStatus.granted) {
      return false;
    }

    PermissionStatus permissionStatusMicrophone =
        await Permission.microphone.request();
    if (permissionStatusMicrophone != PermissionStatus.granted) {
      return false;
    }

    PermissionStatus permissionStatusManageExternalStorage =
        await Permission.manageExternalStorage.request();
    if (permissionStatusManageExternalStorage != PermissionStatus.granted) {
      return false;
    }

    return true;
  }

  static Future<bool> askStoragePermission() async {
    PermissionStatus permissionStatusStorage =
    await Permission.storage.request();
    if (permissionStatusStorage != PermissionStatus.granted) {
      return false;
    }

    PermissionStatus permissionStatusManageExternalStorage =
    await Permission.manageExternalStorage.request();
    if (permissionStatusManageExternalStorage != PermissionStatus.granted) {
      return false;
    }

    return true;
  }
}
