import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  final Function onSend;

  const MessageBox({this.onSend});

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _send(text) {
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _controller,
            onSubmitted: _send,
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () => {_send(_controller.text)})
        ],
      ),
    );
  }
}
