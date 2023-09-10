class Mail {
  int id;
  String subject;
  String message;
  String shortMessage;
  String sender;
  String senderDp;
  String timestamp;

  Mail({
    required this.id,
    required this.subject,
    required this.message,
    required this.shortMessage,
    required this.sender,
    required this.senderDp,
    required this.timestamp,
  });
}
