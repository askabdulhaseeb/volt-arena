import 'package:flutter/material.dart';
import '../../../../widgets/empty_iconic_widget.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);
  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('All Chats'),
      ),
      body: const EmptyIconicWidget(
        icon: Icons.chat,
        title: 'No chat available',
        subtitle: '''No announcement available''',
      ),
    );
  }
}
