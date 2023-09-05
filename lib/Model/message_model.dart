class Message {
  final String message;
  final String name;
  Message(this.message, this.name);

  factory Message.fromJson(jsonData) {
    return Message(jsonData["message"], jsonData["id"]);
  }
}
