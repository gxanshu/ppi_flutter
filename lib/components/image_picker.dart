import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future _pickImage(ImageSource source, BuildContext context,
    void Function(File? img) setImage) async {
  try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    img = await _cropImage(imageFile: img);
    setImage(img);
    Navigator.of(context).pop();
  } on PlatformException catch (e) {
    print(e);
    Navigator.of(context).pop();
  }
}

Future<File?> _cropImage({required File imageFile}) async {
  CroppedFile? croppedImage =
      await ImageCropper().cropImage(sourcePath: imageFile.path);
  if (croppedImage == null) return null;
  return File(croppedImage.path);
}

void showSelectPhotoOptions(
    BuildContext context, void Function(File? img) setImage) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.28,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -35,
                      child: Container(
                        width: 50,
                        height: 6,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      OutlinedButton.icon(
                        onPressed: () => {
                          _pickImage(ImageSource.gallery, context, setImage)
                        },
                        icon: const Icon(Icons.image),
                        label: const Text('Browse Gallery'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'OR',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        onPressed: () =>
                            {_pickImage(ImageSource.camera, context, setImage)},
                        icon: const Icon(Icons.camera),
                        label: const Text('Use a Camera'),
                      ),
                    ])
                  ],
                ),
              ));
        }),
  );
}
