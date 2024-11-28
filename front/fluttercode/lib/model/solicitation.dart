class Solicitation {
  bool? success;
  Null? messages;
  Response? response;
  String? dataResponseType;
  Null? elapsedTime;

  Solicitation(
      {this.success,
      this.messages,
      this.response,
      this.dataResponseType,
      this.elapsedTime});

  Solicitation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messages = json['messages'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    dataResponseType = json['dataResponseType'];
    elapsedTime = json['elapsedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['messages'] = this.messages;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['dataResponseType'] = this.dataResponseType;
    data['elapsedTime'] = this.elapsedTime;
    return data;
  }
}

class Response {
  int? protocol;
  int? assignmentId;
  String? message;

  Response({this.protocol, this.assignmentId, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    protocol = json['protocol'];
    assignmentId = json['assignmentId'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protocol'] = this.protocol;
    data['assignmentId'] = this.assignmentId;
    data['message'] = this.message;
    return data;
  }
}
