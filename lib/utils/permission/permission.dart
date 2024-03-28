import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static getStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    debugPrint("STORAGE STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.storage.request();
      debugPrint("STORAGE STATUS AFTER ASK:$status");
    }
  }
  static getCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.camera.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getBluetoothPermission() async {
    PermissionStatus status = await Permission.bluetooth.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.bluetooth.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getAudioPermission() async {
    PermissionStatus status = await Permission.audio.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.audio.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getPhonePermission() async {
    PermissionStatus status = await Permission.phone.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.phone.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getBackgroundRefreshPermission() async {
    PermissionStatus status = await Permission.backgroundRefresh.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.backgroundRefresh.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getSmsPermission() async {
    PermissionStatus status = await Permission.sms.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.sms.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }
  static getLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    debugPrint("LOCATION STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.location.request();
      debugPrint("LOCATION STATUS AFTER ASK:$status");
    }
  }
  static getContactsPermission() async {
    PermissionStatus status = await Permission.contacts.status;
    debugPrint("CONTACT STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.contacts.request();
      debugPrint("CONTACT STATUS AFTER ASK:$status");
    }
  }
  static getScanPermission() async {
    PermissionStatus status = await Permission.bluetoothScan.status;
    debugPrint("CONTACT STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.bluetoothScan.request();
      debugPrint("CONTACT STATUS AFTER ASK:$status");
    }
  }
  static getSomePermissions() async {
    List<Permission> permissions = [
      Permission.notification,
      Permission.sms,
      Permission.speech,
      Permission.contacts,
      Permission.sms,
      Permission.bluetooth,
      Permission.bluetoothScan,
    ];
    Map<Permission, PermissionStatus> somePermissionsResults =
    await permissions.request();

    debugPrint(
        "NOTIFICATION STATUS AFTER ASK:${somePermissionsResults[Permission.notification]}");
    debugPrint(
        "SMS STATUS AFTER ASK:${somePermissionsResults[Permission.sms]}");
    debugPrint(
        " SPEECH AFTER ASK:${somePermissionsResults[Permission.speech]}");
  }
}