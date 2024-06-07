import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  Future<void> deletePost(int postId) async {
    final response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, post is successfully deleted.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Post has been deleted successfully."),
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
      // throw an exception.
      throw Exception('Failed to delete post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Data Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => deletePost(1), // Assuming you want to delete the post with ID 1
          child: const Text('Delete Post'),
        ),
      ),
    );
  }
}
