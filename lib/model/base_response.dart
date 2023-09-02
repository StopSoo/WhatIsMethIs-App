class BaseResponse{
  final dynamic isSuccess;
  final dynamic code;
  final dynamic message;
  final dynamic result;

  BaseResponse({this.isSuccess, this.code, this.message, this.result});

  factory BaseResponse.fromJson(Map<dynamic, dynamic> json){
    print('isSuccess: ${json['isSuccess']}');
    print('code: ${json['code']}');
    print('message: ${json['message']}');
    print('result: ${json['result']}');


    return BaseResponse(
      isSuccess: json['isSuccess'],
      code: json['code'],
      message: json['message'],
      result: json['result']
    );
  } 

}