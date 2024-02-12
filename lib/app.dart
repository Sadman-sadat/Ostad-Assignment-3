import 'package:assignment_2/Screens/photo_gallery.dart';
import 'package:flutter/material.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white
        )
      ),
      home: const PhotoGalleryListScreen(),
    );
  }
}
