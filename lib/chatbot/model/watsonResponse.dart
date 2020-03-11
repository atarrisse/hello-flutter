class WatsonResponse {
  final response;
  final intents;
  final entities;

  WatsonResponse({this.response, this.intents, this.entities});

  factory WatsonResponse.fromJson(Map<String, dynamic> json) {
    return WatsonResponse(
      response: json['generic'],
      intents: json['intents'],
      entities: json['entities'],
    );
  }

  getText() {
    return response[0]['text'];
  }
}
