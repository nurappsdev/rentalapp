import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:alora/core/utils/custom_snack_bar.dart';

class ImagePickerUtils {
  static Future<File?> pickImageFile() async {
   final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final String ext = file.path.split('.').last.toLowerCase();

      if (<String>['jpg', 'jpeg', 'png', 'heic'].contains(ext)) {
        return file;
      } else {
        CustomSnackBar.show(message: "❌ Unsupported image format: .$ext", type: SnackBarType.error);
        return null;
      }
    }

    return null;
  }
  
}