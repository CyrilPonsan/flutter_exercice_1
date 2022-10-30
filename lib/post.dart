class Post {
  String name;
  String time;
  String imagePath;
  String desc;
  int likes;
  int comments;

  Post({
    required this.name,
    required this.time,
    required this.imagePath,
    required this.desc,
    this.likes = 0,
    this.comments = 0
  });

  String setTime() => "Il y a $time";

  String setLikes() {
    return "$likes j'aime";
  }

  String setComments() {
    if (comments > 1) {
      return "$comments commentaires";
    } else {
      return "$comments commentaire";
    }
  }
}
