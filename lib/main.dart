import 'package:flutter/material.dart';

void main() {
  runApp(const FriendApp());
}

class FriendApp extends StatelessWidget {
  const FriendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Friend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();

  List<String> messages = [];

  String getReply(String text) {
    text = text.toLowerCase();

    if (text.contains("hello") || text.contains("hi")) {
      return "Hey! Nice to meet you 😊";
    }

    if (text.contains("how are you")) {
      return "I'm doing great! Thanks for asking.";
    }

    if (text.contains("name")) {
      return "I'm Alex, your virtual friend.";
    }

    if (text.contains("bye")) {
      return "See you later! Take care 👋";
    }

    return "You said: $text\nTell me more about that.";
  }

  void sendMessage() {
    String text = controller.text.trim();

    if (text.isEmpty) return;

    String reply = getReply(text);

    setState(() {
      messages.add("You: $text");
      messages.add("Alex: $reply");
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alex - AI Friend"),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    messages[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => sendMessage(),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: sendMessage,
                  child: const Text("Send"),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
