import 'package:hackforgood/models/chat_message.dart';

class Projects {
  final String name;
  final String image;
  final List<String> gallery;
  final String description;
  final int fundings_recieved;
  final int fundings_needed;
  final String manpower;
  final String organisation;
  final List<ChatMessage> messages;
  bool isFavourite;

  Projects({
    required this.name,
    required this.image,
    required this.gallery,
    required this.description,
    required this.fundings_recieved,
    required this.fundings_needed,
    required this.manpower,
    required this.organisation,
    required this.messages,
    this.isFavourite = false,
  });
}
