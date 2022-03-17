import 'chat_message.dart';

class Family {
  final String name;
  final String image;
  final List<String> gallery;
  final String description;
  final String organisation;
  final int noOfPax;
  final int noOfRooms;
  final double householdIncome;
  final List<ChatMessage> messages;

  const Family({
    required this.name,
    required this.image,
    required this.gallery,
    required this.description,
    required this.organisation,
    required this.noOfPax,
    required this.noOfRooms,
    required this.householdIncome,
    required this.messages,
  });
}
