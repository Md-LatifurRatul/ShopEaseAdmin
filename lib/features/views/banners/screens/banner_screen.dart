import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/widgets/side_bar_menu.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  String currentRoute = "/banners";

  final TextEditingController _titleController = TextEditingController();
  Uint8List? _selectedImageBytes;

  Future<void> _pickBannerImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedImageBytes = result.files.single.bytes;
      });
    }
  }

  Future<void> _uploadBanner() async {
    // Backend
    setState(() {
      _titleController.clear();
      _selectedImageBytes = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFormComplete =
        _titleController.text.isNotEmpty && _selectedImageBytes != null;

    return Scaffold(
      body: Row(
        children: [
          SideBarMenu(
            selectRoute: currentRoute,
            onMenuItemSelected: (route) {
              setState(() {
                currentRoute = route;
              });
              Navigator.pushNamed(context, route);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [_buildHeader(), _buildBannerForm(isFormComplete)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 60,
      color: Colors.deepPurple[50],
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: const Text(
        "Manage Banners",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBannerForm(bool isFormComplete) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Banner Title"),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter your banner title'
                        : null,

            onChanged: (_) {},
          ),
          const SizedBox(height: 20),

          if (_selectedImageBytes != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Card(
                elevation: 5,
                child: Image.memory(
                  _selectedImageBytes!,

                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _pickBannerImage,
            icon: const Icon(Icons.image),
            label: const Text("Choose Image"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (isFormComplete) {
                  _uploadBanner();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade900,
              ),
              child: const Text(
                "Upload Banner",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
