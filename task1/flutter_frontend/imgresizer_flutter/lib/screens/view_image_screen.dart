import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../api_service.dart';

class ViewImageScreen extends StatelessWidget {
  final int imageId;
  const ViewImageScreen({Key? key, required this.imageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    Future<void> downloadImage(String imageUrl, String fileName) async {
      try {
        Dio dio = Dio();
        Directory? directory;
        if (Platform.isAndroid) {
          directory = Directory('/storage/emulated/0/Download');
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        }
        String filePath = '${directory!.path}/$fileName';
        await dio.download(imageUrl, filePath);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image downloaded to $filePath')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error downloading image: $e')),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Download Image'),backgroundColor: Colors.teal[100],centerTitle: true,),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: apiService.fetchImageDetails(imageId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Failed to load image details'));
          }

          final imageUrls = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                Text('Original: ${imageUrls['original']}'),
                Image.network("http://192.168.91.174:8000/" + imageUrls['original']),
                SizedBox(height: 10,),

                InkWell(
                  onTap:(){ downloadImage(
                      "http://192.168.91.174:8000/" + imageUrls['original'],
                      'original_image.jpg');},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(30),),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Download Original",style: TextStyle(color: Colors.white),),
                          Icon(Icons.download,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Small: ${imageUrls['small']}'),
                Image.network("http://192.168.91.174:8000/" + imageUrls['small']),
                SizedBox(height: 10,),

                InkWell(
                  onTap:(){ downloadImage(
                      "http://192.168.91.174:8000/" + imageUrls['small'],
                      'small_image.jpg');},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(30),),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Download Small",style: TextStyle(color: Colors.white),),
                          Icon(Icons.download,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Medium: ${imageUrls['medium']}'),

                Image.network("http://192.168.91.174:8000/" + imageUrls['medium']),
                SizedBox(height: 10,),

                InkWell(
                  onTap:(){ downloadImage(
                      "http://192.168.91.174:8000/" + imageUrls['medium'],
                      'medium_image.jpg');},
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(30),),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Download Medium",style: TextStyle(color: Colors.white),),
                          Icon(Icons.download,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 20,),


              ],
            ),
          );
        },
      ),
    );
  }
}
