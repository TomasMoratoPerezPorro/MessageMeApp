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
            child: Material(
              shape: StadiumBorder(),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controller,
                  onSubmitted: _send,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Material(
            elevation: 2,
            color: Theme.of(context).primaryColor,
            shape: CircleBorder(),
            child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () => {_send(_controller.text)}),
          )
        ],
      ),
    );
  }
}
