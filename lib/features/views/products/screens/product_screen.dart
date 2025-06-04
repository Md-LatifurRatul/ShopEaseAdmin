import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/features/views/products/widgets/header_widget.dart';
import 'package:shop_ease_admin/widgets/custom_image_card.dart';
import 'package:shop_ease_admin/widgets/custom_upload_button.dart';
import 'package:shop_ease_admin/widgets/image_selecting_button.dart';
import 'package:shop_ease_admin/widgets/side_bar_menu.dart';
import 'package:shop_ease_admin/widgets/snack_message.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String currentRoute = "/products";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Uint8List? _selectedImage;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImage = result.files.single.bytes;
      });
    }
  }

  void _uploadProduct() async {
    if (_nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _ratingController.text.isEmpty ||
        _descController.text.isEmpty ||
        _selectedImage == null) {
      SnackMessage.showSnackMessage(context, "Please fill all the fields");
      return;
    }

    setState(() {
      _nameController.clear();
      _priceController.clear();
      _ratingController.clear();
      _descController.clear();
      _selectedImage = null;
    });

    // ! Handle API Later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarMenu(
            selectRoute: currentRoute,
            onMenuItemSelected: (route) {
              setState(() {
                currentRoute = route;
                Navigator.pushNamed(context, route);
              });
            },
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(title: "Manage Products"),
                _buildProductForm(),
              ],
            ),
          ),
        ],
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
          CustomImageCard(imageBytes: _selectedImage),
          const SizedBox(height: 10),

          Row(
            children: [
              ImageSelectingButton(
                label: "Pick Product Image",
                onPressed: _pickImage,
              ),

              const SizedBox(width: 20),
            ],
          ),

          const SizedBox(height: 24),

          CustomUploadButton(
            label: "Upload Product",
            onPressed: _uploadProduct,
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
