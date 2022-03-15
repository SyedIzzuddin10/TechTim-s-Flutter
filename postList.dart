// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, prefer_const_constructors_in_immutables, unnecessary_new, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'post.dart';

class PostLists extends StatefulWidget {
  final List<Post> listItems;

  PostLists(this.listItems);

  @override
  State<PostLists> createState() => _PostListsState();
}

class _PostListsState extends State<PostLists> {
  void like(Function callBack) {
    setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      post.likes.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () => like(post.likePost),
                    color: post.userLiked ? Colors.green : Colors.black,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
