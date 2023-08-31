// image picker in my page
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application/constants/colors.dart';

class ImagePickerWidgetMP extends StatefulWidget {
  const ImagePickerWidgetMP({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidgetMP> createState() => _ImagePickerWidgetMPState();
}

class _ImagePickerWidgetMPState extends State<ImagePickerWidgetMP> {
  XFile? _image; // 이미지를 담을 변수
  final ImagePicker picker = ImagePicker(); // ImagePicker 초기화

  // 이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPhotoArea();
  }

  Widget _buildPhotoArea() {
    return _image != null
      ? CupertinoButton(
        onPressed: () {
          getImage(ImageSource.gallery);
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
          child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
        ),
      )
      : CupertinoButton(
        onPressed: () {
          getImage(ImageSource.gallery);
        },
        child: Container(
          color: white,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5.0,
                      offset: Offset(0, 10), // changes position of shadow
                    ),
                  ],
                  color: white
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(26, 26, 26, 26),
                child: Icon(
                  CupertinoIcons.photo_on_rectangle,
                  size: 28,
                  color: dark_gray,
                )
              )
            ],
          ),
        ),
      );
  }
}