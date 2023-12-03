class Message {
  String msg;
  final MessageType msgType;

  Message({required this.msg, required this.msgType});
}

enum MessageType { user, bot }