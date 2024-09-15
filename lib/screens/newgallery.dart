import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:image_picker/image_picker.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  File? _image;
  final picker=ImagePicker();

  Future getImage()async{
     final pickImage=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickImage!=null){
        _image=File(pickImage.path);
      }else{
        print('no image');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image"),),
      body: Center(
        child: _image==null?Text('no image'):Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(onPressed: getImage,child: Icon(Icons.add_a_photo),),
    );
  }
}
