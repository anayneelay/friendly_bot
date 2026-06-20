TextEditingController controller = TextEditingController();

ElevatedButton(
  onPressed: () async {
    String message = controller.text;

    // Send message to AI
    String reply = await getReply(message);

    setState(() {
      messages.add(reply);
    });
  },
  child: Text("Send"),
)

Future<String> getReply(String text) async {
  // Send text to your backend or AI API
  return "Hey! You said: $text";
}
