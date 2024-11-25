import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../api_service.dart';
import 'view_image_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ApiService _apiService = ApiService();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    final response = await _apiService.uploadImage(_imageFile!.path);
    if (response != null && response.statusCode == 201) {
      final data = json.decode(response.body);
      setState(() {
        _imageFile=null;

      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewImageScreen(imageId: data['id'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image upload failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Upload Image'),backgroundColor: Colors.teal[100],centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageFile != null
              ? Image.file(_imageFile!, height: 200)
              : Center(
                child: Column(
                  children: [
                    Icon(Icons.image_not_supported_outlined,size: 200,),
                    const Text('No image selected'),
                  ],
                ),
              ),
          InkWell(
            onTap: _pickImage,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(30),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Image"),
                    Icon(Icons.photo_size_select_large_rounded)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: _uploadImage,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(30),),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upload Image",style: TextStyle(color: Colors.white),),
                    Icon(Icons.upload,color: Colors.white,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
