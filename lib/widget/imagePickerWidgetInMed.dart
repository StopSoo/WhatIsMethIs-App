// image picker in medicine page
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application/constants/colors.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _image; // 이미지를 담을 변수
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화

  // 이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
        convertBase64(_image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhotoArea();
  }

  Widget _buildPhotoArea() {
    if (_image != null) {
      return CupertinoButton(
        onPressed: () {
          getImage(ImageSource.gallery);
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
        ),
      );
    } else {
      return CupertinoButton(
        onPressed: () {
          getImage(ImageSource.gallery);
        },
        child: Container(
          color: white,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: main_color_green),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(26, 26, 26, 26),
                  child: const Icon(
                    CupertinoIcons.photo_on_rectangle,
                    size: 28,
                    color: dark_green,
                  ))
            ],
          ),
        ),
      );
    }
  }
}

// make function to convert image to base64
String convertBase64(XFile image) {
  final bytes = File(image.path).readAsBytesSync();
  // String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
  String base64Image = base64Encode(bytes);
  print("img_pan : $base64Image");

  return "";
  // List<int> imageBytes = File(image.path).readAsBytesSync();
  // String base64Image = base64Encode(imageBytes);
  // return base64Image;
}
