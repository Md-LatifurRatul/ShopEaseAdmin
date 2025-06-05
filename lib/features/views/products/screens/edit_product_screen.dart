import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/widgets/custom_image_card.dart';
import 'package:shop_ease_admin/widgets/custom_upload_button.dart';
import 'package:shop_ease_admin/widgets/image_selecting_button.dart';
import 'package:shop_ease_admin/widgets/snack_message.dart';

class EditProductScreen extends StatefulWidget {
  // final String name;
  // final double price;
  // final double rating;
  // final String description;
  // final Uint8List? image;

  const EditProductScreen({
    super.key,
    // required this.name,
    // required this.price,
    // required this.rating,
    // required this.description,
    // this.image,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  Uint8List? _selectUpdateImage;

  // @override
  // void initState() {
  //   super.initState();
  //   _nameController.text = widget.name;
  //   _priceController.text = widget.price.toString();
  //   _ratingController.text = widget.rating.toString();
  //   _descController.text = widget.description;
  //   _selectUpdateImage = widget.image;
  // }

  Future<void> _pickUpdateImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectUpdateImage = result.files.single.bytes;
      });
    }
  }

  void _uploadUpdateProduct() async {
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _ratingController.text.isEmpty ||
        _descController.text.isEmpty ||
        _selectUpdateImage == null) {
      SnackMessage.showSnackMessage(context, "Please fill all the fields");
      return;
    }

    setState(() {
      _nameController.clear();
      _priceController.clear();
      _ratingController.clear();
      _descController.clear();
      _selectUpdateImage = null;
    });

    // ! Handle API Later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildProductForm()],
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildTextField(_nameController, "Product Name")),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  _priceController,
                  "Price",
                  inputType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  _ratingController,
                  "Rating",
                  inputType: TextInputType.number,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _buildTextField(_descController, "Description", maxLines: 3),

          const SizedBox(height: 16),
          CustomImageCard(imageBytes: _selectUpdateImage),
          const SizedBox(height: 10),

          Row(
            children: [
              ImageSelectingButton(
                label: "Pick Update Product Image",
                onPressed: _pickUpdateImage,
              ),

              const SizedBox(width: 20),
            ],
          ),

          const SizedBox(height: 24),

          CustomUploadButton(
            label: "Update Product",
            onPressed: _uploadUpdateProduct,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: inputType,
      decoration: InputDecoration(labelText: label),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _ratingController.dispose();
    _descController.dispose();
    super.dispose();
  }
}
