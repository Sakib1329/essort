import 'dart:io';
import 'package:essort/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomSheetController extends GetxController {
  final ImagePicker picker = ImagePicker();
  var pickedImagePath = ''.obs;

  void getBottomSheet() {
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(20),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt, size: 50, color: AppColors.primary),
                ),
                Text('Camera',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library_rounded, size: 50, color: AppColors.primary),
                ),
                Text('Gallery',
                    style: TextStyle(
                        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      // Request appropriate permission
      bool hasPermission = await _requestPermission(source);
      if (!hasPermission) {
        Get.snackbar(
          "Permission Denied",
          source == ImageSource.camera
              ? "Camera access is required."
              : "Gallery access is required.",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      }

      // Pick image
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        File image = File(pickedFile.path);
        // Verify file exists
        if (await image.exists()) {
          pickedImagePath.value = pickedFile.path;
        } else {
          Get.snackbar(
            "Error",
            "Selected image is not accessible.",
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
      } else {
        // User canceled the picker
        print("No image selected.");
      }
    } catch (e) {
      print("Image picker error: $e");
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  Future<bool> _requestPermission(ImageSource source) async {
    if (source == ImageSource.camera) {
      var status = await Permission.camera.request();
      return status.isGranted;
    } else {
      // For gallery, use Permission.photos (Android 13+ and iOS)
      var status = await Permission.photos.request();
      if (!status.isGranted) {
        // Fallback for older Android versions (<13) if needed
        var storageStatus = await Permission.storage.request();
        return storageStatus.isGranted;
      }
      return true;
    }
  }
}