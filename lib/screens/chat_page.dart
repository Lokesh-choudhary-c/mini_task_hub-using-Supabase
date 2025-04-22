import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messages = <String>['Hello!', 'How are you?'];
  final _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final leftBubbleColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;
    final rightBubbleColor = const Color(0xFFFFC107);
    final textColor = isDark ? Colors.white : Colors.black87;

    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (_, i) => Align(
              alignment:
                  i.isEven ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: i.isEven ? leftBubbleColor : rightBubbleColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _messages[i],
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _ctrl,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.black45,
                  ),
                  filled: true,
                  fillColor:
                      isDark ? Colors.grey[800] : Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: rightBubbleColor),
              onPressed: () {
                if (_ctrl.text.trim().isEmpty) return;
                setState(() {
                  _messages.add(_ctrl.text.trim());
                  _ctrl.clear();
                });
              },
            )
          ]),
        )
      ]),
    );
  }
}


