

class BaseResponse {
  late int status;
  late String error;
  late String message;
  late String messageTxt;
  late Map<String, dynamic> data;
  late List<dynamic> listData;
  late String dataString;
  late int dataInteger;
  late double dataDouble;
  late bool isValid;
  late String result;
  late String msg;
  late bool dataSuccess;


  static BaseResponse fromJson(Map<String, dynamic> json) {
    BaseResponse response = BaseResponse();
    response.status = json['status'] as int;
    response.error = json['error'] as String;
    response.message = json['message'] as String;
    response.message = json['MessageText'] as String;
    response.messageTxt = json['message'] as String;
    response.msg = json['Message'] as String;
    //Todo
//    response.message = "Something went wrong,Please try again later";
    if(json['Token'] is String) {
      print("BASECALLED::${json}");
      response.data = json;
    }
    if(json['HeaderImage'] is List<dynamic>) {
      print("BASECALLED::${json}");
      response.data = json;
    }
    if(json['BankTransactionId'] is String) {
      print("BASECALLED1::${json}");
      response.data = json;
      return response;
    }
    if(json['meterid'] is String) {
      print("METER_ID::${json}");
      response.data = json;
      return response;
    }
    // if(json['IsValid'] is bool) {
    //   print("METER_ID::${json}");
    //   response.isValid = json['IsValid'] as bool;
    //   return response;
    // }
    if (json['data'] is String){
      response.dataString = json['data'] as String;
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = json['data'] as Map<String, dynamic>;
    } else if (json['data'] is List<dynamic>) {
      print("DATACALLED");
      response.listData = json['data'] as List<dynamic>;
    } else if (json['data'] is bool) {
      response.dataSuccess = json['data'] as bool;
    }else if (json['data'] is int) {
      response.dataInteger = json['data'] as int;
    }else if (json['data'] is double) {
      response.dataDouble = json['data'] as double;
    } else if (json['Records'] is List<dynamic>) {
      response.listData = json['Records'] as List<dynamic>;
    }else if (json['Result'] is String) {
      response.result = json['Result'] as String;
    }else if (json['Result'] is List<dynamic>) {
      response.listData = json['Result'] as List<dynamic>;
    } else if (json['Records'] is Map<String, dynamic>){
      response.data = json['Records'] as Map<String, dynamic>;
    } else if (json['IsValid'] is bool) {
      response.isValid = json['IsValid'] as bool;
    }  else {
      response.data = json;
    }

    return response;
  }

  @override
  String toString() {
    return 'BaseResponse{status: $status, error: $error, message: $message, data: $data, listData: $listData,dataString:$dataString}';
  }

}
