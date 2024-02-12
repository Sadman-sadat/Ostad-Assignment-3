import 'package:assignment_2/Screens/photo_details.dart';
import 'package:assignment_2/data/photo_api_service.dart';
import 'package:flutter/material.dart';
import '../data/Model/photo_model.dart';

class PhotoGalleryListScreen extends StatefulWidget {
  const PhotoGalleryListScreen({super.key});

  @override
  State<PhotoGalleryListScreen> createState() => _PhotoGalleryListScreenState();

}

class _PhotoGalleryListScreenState extends State<PhotoGalleryListScreen> {

  List<Photo> photoList = [];
  bool _getPhotoListInProgress = false;

  @override
  void initState(){
    super.initState();
    getPhotosFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Gallery App'),),
      body: Visibility(
        visible: _getPhotoListInProgress == false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(itemCount: photoList.length, itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetails(photo: photoList[index]),
                ),
              );
            },
            title: Text(photoList[index].title ?? 'Unknown'),
            leading: InkWell(
              child: SizedBox(
                //color: Colors.deepPurpleAccent,
                height: 50,
                width: 50,
                child: Image.network(photoList[index].thumbnailUrl ?? ''),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<void> getPhotosFromApi() async {
    _getPhotoListInProgress = true;
    setState(() {});

    try {
      List<Photo> fetchedPhotos = await PhotoApiService.getPhotosFromApi();
      photoList.addAll(fetchedPhotos);
    } catch (error) {
      print("Error fetching data: $error");
    }

    _getPhotoListInProgress = false;
    setState(() {});
  }
}
