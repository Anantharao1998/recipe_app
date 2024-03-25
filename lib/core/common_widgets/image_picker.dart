import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/core/core.dart';

/// Common Image picker widget
class ImagePickerWidget extends StatefulWidget {
  /// constructor
  const ImagePickerWidget({required this.onImagePick, this.imagePath, super.key});

  /// Callback on image picked
  final Function(XFile picture) onImagePick;

  /// Can pass image to this widget
  final String? imagePath;

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _pickImage(final ImageSource source) async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        widget.onImagePick.call(pickedImage);

        _image = File(pickedImage.path);
      }
    });
  }

  @override
  void initState() {
    if (widget.imagePath != null) {
      if (widget.imagePath!.startsWith('/')) {
        _image = File(widget.imagePath!);
      }
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_image != null) Image.file(_image!, height: 200),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async => _pickImage(ImageSource.gallery),
            child: const Text(AppStrings.pickImage),
          ),
        ],
      );
}
