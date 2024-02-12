import 'dart:convert';
import 'package:http/http.dart';
import 'models/photo_model.dart';

class PhotoApiService {
  static Future<List<Photo>> getPhotosFromApi() async {
    List<Photo> photoList = [];

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    try {
      Response response = await get(uri);

      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        if (decodeResponse is List) {
          var fetchedPhotosList = decodeResponse;
          for (var fetchedPhotos in fetchedPhotosList) {
            Photo photo = Photo.fromJson(fetchedPhotos);
            photoList.add(photo);
          }
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print("Error fetching data: $error");
    }

    return photoList;
  }
}
