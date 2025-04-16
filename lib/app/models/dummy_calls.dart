import 'call_model.dart';

final List<CallModel> dummyCallLogs = [
  CallModel(
    name: "Malik Imran",
    avatarUrl: "https://i.pravatar.cc/150?img=1",
    subtitle: "Incoming",
    time: "12:36 PM",
    type: CallType.incoming,
  ),
  CallModel(
    name: "IRFAN J",
    avatarUrl: "https://i.pravatar.cc/150?img=2",
    subtitle: "Outgoing",
    time: "12:24 PM",
    type: CallType.outgoing,
  ),
  CallModel(
    name: "Mahmood",
    avatarUrl: "https://i.pravatar.cc/150?img=3",
    subtitle: "Outgoing (2)",
    time: "4/14/2025",
    type: CallType.outgoing,
  ),
  CallModel(
    name: "Muhammad",
    avatarUrl: "https://i.pravatar.cc/150?img=4",
    subtitle: "Missed",
    time: "4/14/2025",
    type: CallType.missed,
  ),
  CallModel(
    name: "Abu",
    avatarUrl: "https://i.pravatar.cc/150?img=5",
    subtitle: "Incoming",
    time: "4/13/2025",
    type: CallType.incoming,
  ),
];
