import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MediaFile> _selectedFile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<MediaFile> mediaFiles = await GalleryPicker.pickMedia(
                  context: context, singleMedia: false) ??
              [];
          setState(() {
            _selectedFile = mediaFiles;
          });
        },
        child: Icon(Icons.image),
      ),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _selectedFile.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            MediaFile _file = _selectedFile[index];
            if (_file.isImage) {
              print("image here");
              return PhotoProvider(media: _file);
            } else if (_file.isVideo) {
              return VideoProvider(media: _file);
            }
            ;
          }),
    );
  }
}
