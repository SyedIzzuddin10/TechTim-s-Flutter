// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this, prefer_const_constructors_in_immutables, unnecessary_new, avoid_unnecessary_containers

class Post {
  late String body;
  late String author;
  late int likes = 0;
  late bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;

    if (userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}
