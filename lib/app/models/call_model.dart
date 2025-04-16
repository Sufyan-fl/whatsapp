enum CallType {
  incoming,
  outgoing,
  missed,
}

class CallModel {
  final String name;
  final String avatarUrl;
  final String time;
  final String subtitle;
  final CallType type;

  CallModel({
    required this.name,
    required this.avatarUrl,
    required this.time,
    required this.subtitle,
    required this.type,
  });
}
