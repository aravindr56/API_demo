import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PutData extends StatefulWidget {
  const PutData({super.key});

  @override
  State<PutData> createState() => _PutDataState();
}

class _PutDataState extends State<PutData> {
  Future<void> updatePost(int postId, String title, String body) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then the post was successfully updated.
      final responseBody = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Post Updated"),
            content: Text("Post ID: ${responseBody['id']} updated successfully."),
            actions: [
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update post');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Put Data Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => updatePost(1, 'Updated Title', 'Updated body text'),
          child: const Text('Update Post'),
        ),
      ),
    );
  }
}
