import 'package:flutter/material.dart';
import '../data/Model/photo_model.dart';

class PhotoDetails extends StatefulWidget {
  const PhotoDetails({super.key, required this.photo});

  final Photo photo;

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                widget.photo.url ?? '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text("Title: ${widget.photo.title ?? 'Unknown'}"),
                    Text("ID: ${widget.photo.id ?? 'Unknown'}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
