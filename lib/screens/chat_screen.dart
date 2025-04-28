import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<void> sendMessage() async {
    final message = _controller.text;
    final url = Uri.parse('http://10.0.2.2:5000/chat'); //  

    try {
      // Check if the message is empty

      if (message.trim().isEmpty) {
        setState(() {
          _response = 'Please enter a message';
        });
        return;
      }
      // Send the message to the server using HTTP POST request
      final res = await http.post(url, headers: {'Content-Type': 'application/json'}, body: jsonEncode({'message': message}));

      // Check the response from the server
      if (res.statusCode == 200) {
        // Parse the response
        final data = jsonDecode(res.body);
        setState(() {
          // containing the response from ChatGPT
          _response = data['reply'];
        });
      } else {
        // Handle the case where the server returns an error
        setState(() {
          _response = 'Error from server';
        });
      }
    } catch (e) {
      // Handle any errors that occur during the request
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT', style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w700, letterSpacing: 7.0)),
        centerTitle: true,
        elevation: 0.0, //
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _response, // Display the response from the server
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(color: const Color(0xFF000000), borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                // TextField for user input
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                    labelText: 'Ask Anything',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 24.0),

                // buttons
                Row(
                  children: [
                    // Send button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: sendMessage, // Call the sendMessage function when the button is pressed
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                          backgroundColor: const Color(0xFFAC7CFF),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                        child: const Text('Send', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    //clear button
                    const SizedBox(width: 16.0),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _controller.clear(); // Clear the text field
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0x5BAC7CFF),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      ),
                      child: const Text('Clear', style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ), //
        ],
      ),
    );
  }
}
