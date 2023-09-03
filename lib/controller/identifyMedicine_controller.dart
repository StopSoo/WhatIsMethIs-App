import 'dart:io';

import 'package:flutter_application/model/base_response.dart';
import 'package:flutter_application/model/medicine.dart';
import 'package:flutter_application/model/medicine_info_list_res.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';

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

Future<Medicine?> sendImageToServer(XFile image_) async {
  File image = File(image_.path);
  // 이미지 압축
  File compressedImage = await compressImage(image);

  final baseUrl = dotenv.env['BASE_URL']!;

  // url 생성
  final uri = Uri.parse("$baseUrl/medicines/identify");

  var client = http.Client();
  try {
    // MultipartFile 생성
    final file = await http.MultipartFile.fromPath("files", compressedImage.path);

    // MultipartRequest 생성
    final request = http.MultipartRequest('POST', uri);
    request.files.add(file);

    // 서버로 요청 보내기
    final response = await request.send();

    if (response.statusCode == 200) {
      // 성공적으로 요청이 완료됨
      final responseBody = await http.Response.fromStream(response);
      // print(responseBody.body);
      BaseResponse res = BaseResponse.fromJson(json.decode(responseBody.body));
      MedicineInfoListRes medicineInfoListRes = MedicineInfoListRes.fromJson(res.result);
      Medicine medicine = medicineInfoListRes.medicines[0];
      print(medicine.toJson().toString());
      return medicine;
    } else {
      // 요청 실패
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  } catch (e) {
    Exception(e);
    return null;
  } finally {
    client.close();
  }
}

Future<File> compressImage(File file) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    "${file.absolute.path}.temp.jpg",
    quality: 88, // 품질을 조정하여 이미지 크기를 줄입니다.
    minWidth: 400, // 최소 가로 크기
    minHeight: 300, // 최소 세로 크기
    format: CompressFormat.jpeg, // 출력 형식
  );

  File resultImage = File(result!.path);
  return resultImage;
}

Future<Medicine?> getImageFromCamera(double width) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    final XFile? croppedFile = await _cropImage(pickedFile, width);
    if (croppedFile != null) {
      Medicine? medicine = await sendImageToServer(croppedFile);
      return medicine;
    } else {
      print('이미지를 자르지 않았습니다.');
      return null;
    }
  } else {
    print('사진을 선택하지 않았습니다.');
    return null;
  }
}

Future<XFile?> _cropImage(XFile imageFile, double width) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    aspectRatio: CropAspectRatio(
      ratioX: width,
      ratioY: width * 0.5,
    ),
  );

  if (croppedFile == null) {
    return null;
  }
  XFile? resFile = XFile(croppedFile.path);

  return resFile;
}
