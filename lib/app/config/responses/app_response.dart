import "dart:io";

class AppResponse {
  final bool success;
  final String? messageServer;
  final String? messageUser;
  final dynamic response;

  const AppResponse({
    this.success = false,
    this.messageServer,
    this.messageUser,
    this.response,
  });

  static AppResponse requestResponse(dynamic response) {
    try {
      switch (response.statusCode) {
        case 200:
          return AppResponse(
            success: true,
            messageServer: response.reasonPhrase,
            messageUser: response.reasonPhrase,
          );
        case 201:
          return AppResponse(
            success: true,
            messageServer: response.reasonPhrase,
            messageUser: response.reasonPhrase,
          );
        case 400:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Bad Request",
          );
        case 401:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Unauthorized",
          );
        case 404:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Not Found",
          );
        case 405:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Method Not Allowed",
          );
        case 408:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Request Timeout",
            response: response.body,
          );
        case 440:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Login Time-out",
          );
        case 500:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Internal Server Error",
          );
        case 501:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Not Implemented",
          );
        case 502:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Bad Gateway",
          );
        case 503:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Service Unavailable",
          );
        case 504:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Gateway Timeout",
          );
        case 511:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Network Authentication Required",
          );
        default:
          return AppResponse(
            success: false,
            messageServer: response.reasonPhrase,
            messageUser: "Something Wrong",
          );
      }
    } on SocketException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "No Internet",
      );
    } on FormatException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "Bad Response",
      );
    } on HttpException {
      return AppResponse(
        success: false,
        messageServer: response.reasonPhrase,
        response: "Server not responding",
      );
    }
  }
}

/*Future<http.Response> GET(String endPoint) async {
  final String endPoint_ = "${RestAPI.api_url}/$endPoint";
  final String authorization = "";
  final Uri uri = Uri.parse(endPoint_);
  //log(<String, String>{"url": uri.toString(), "authorization": authorization.toString()}.toString());
  final http.Response response = await http.get(
    uri,
    headers: <String, String>{
      "content-type": "application/json",
      "Authorization": "Bearer $authorization",
    },
  );
  return response;
}*/

/*Future<http.Response> DELETE(String endPoint) async {
  final String endPoint_ = "${RestAPI.api_url}/$endPoint";
  final String authorization = "";
  final Uri uri = Uri.parse(endPoint_);
  //log(<String, String>{"url": uri.toString(), "authorization": authorization.toString()}.toString());
  final http.Response response = await http.delete(
    uri,
    headers: <String, String>{
      "content-type": "application/json",
      "Authorization": "Bearer $authorization",
    },
  );
  return response;
}*/

/*Future<http.Response> POST(String endPoint, Map<String, dynamic> body) async {
  final String endPoint_ = "${RestAPI.api_url}/$endPoint";
  final Uri uri = Uri.parse(endPoint_);
  final String body_ = jsonEncode(body);
  final String authorization = "";
  //log(<String, String>{"url": uri.toString(), "authorization": authorization.toString()}.toString());
  final http.Response response = await http.post(
    uri,
    body: body_,
    headers: <String, String>{
      "content-type": "application/json",
      "Authorization": "Bearer $authorization",
    },
  );
  return response;
}*/

/*Future<http.Response> PUT(String endPoint, Map<String, dynamic> body) async {
  final String endPoint_ = "${RestAPI.api_url}/$endPoint";
  final Uri uri = Uri.parse(endPoint_);
  final String body_ = jsonEncode(body);
  final String authorization = "";
  //log(<String, String>{"url": uri.toString(), "authorization": authorization.toString()}.toString());
  final http.Response response = await http.put(
    uri,
    body: body_,
    headers: <String, String>{
      "content-type": "application/json",
      "Authorization": "Bearer $authorization",
    },
  );
  return response;
}*/
