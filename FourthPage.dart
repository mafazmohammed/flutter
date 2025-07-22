import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class MyFourthPage extends StatefulWidget {
  const MyFourthPage({super.key});

  @override
  State<MyFourthPage> createState() => _MyFourthPageState();
}

class _MyFourthPageState extends State<MyFourthPage> {
  bool isLoading = false;
  final List<_Msg> _messages = [];
  final promptController = TextEditingController();

  final _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey:
        'AIzaSyAb6KNJZcpTJ_LJhqIce-XlaGNvbhvRWIQ', 
  );

  Future<void> _sendPrompt() async {
    final prompt = promptController.text.trim();
    if (prompt.isEmpty) return;

    setState(() {
      _messages.add(_Msg(text: prompt, isUser: true));
      isLoading = true;
    });
    promptController.clear();

    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      final answer = response.text ?? 'No response';
      print("AI Response: $answer");

      setState(() {
        _messages.add(_Msg(text: answer, isUser: false));
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _messages.add(_Msg(text: 'Error: $e', isUser: false));
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'AI Chatbot',
          style: TextStyle(fontFamily: 'Impact', fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildChatList()), 
            if (isLoading) const LinearProgressIndicator(color: Colors.pink),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _messages.length,
      itemBuilder: (_, i) {
        final msg = _messages[i];
        return Align(
          alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: BubbleSpecialThree(
            text: msg.text,
            isSender: msg.isUser,
            color: msg.isUser ? Colors.blueAccent : Colors.grey.shade700,
            tail: true,
            textStyle: TextStyle(
              color: msg.isUser ? Colors.white : Colors.white70,
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputBar() {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: Colors.grey.shade900,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: promptController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.white60),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                filled: true,
                fillColor: Colors.grey,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.pink,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: isLoading ? null : _sendPrompt,
            ),
          ),
        ],
      ),
    );
  }
}

class _Msg {
  final String text;
  final bool isUser;
  _Msg({required this.text, required this.isUser});
}
