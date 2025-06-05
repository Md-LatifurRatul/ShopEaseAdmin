import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/widgets/custom_image_card.dart';
import 'package:shop_ease_admin/widgets/custom_upload_button.dart';
import 'package:shop_ease_admin/widgets/image_selecting_button.dart';
import 'package:shop_ease_admin/widgets/snack_message.dart';

class EditBannerScreen extends StatefulWidget {
  // final String existingTitle;
  // final Uint8List? existingImage;

  const EditBannerScreen({
    super.key,
    // required this.existingTitle,
    // this.existingImage,
  });

  @override
  State<EditBannerScreen> createState() => _EditBannerScreenState();
}

class _EditBannerScreenState extends State<EditBannerScreen> {
  final TextEditingController _titleController = TextEditingController();
  Uint8List? _imageBytes;

  // @override
  // void initState() {
  //   super.initState();
  //   _titleController.text = widget.existingTitle;
  //   _imageBytes = widget.existingImage;
  // }

  Future<void> _pickUpdateBannerImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
      });
    }
  }

  Future<void> _uploadUpdateBanner() async {
    if (_titleController.text.isEmpty || _imageBytes == null) {
      SnackMessage.showSnackMessage(context, "Please fill all the fields");
      return;
    }

    // Backend
    setState(() {
      _titleController.clear();
      _imageBytes = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Banner")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Banner Title"),
            ),
            const SizedBox(height: 20),
            CustomImageCard(imageBytes: _imageBytes),
            const SizedBox(height: 20),

            const SizedBox(height: 10),
            ImageSelectingButton(
              label: "Change Image",
              onPressed: _pickUpdateBannerImage,
            ),

            const SizedBox(height: 30),

            CustomUploadButton(
              label: "Update Banner",
              onPressed: () {
                _uploadUpdateBanner();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
