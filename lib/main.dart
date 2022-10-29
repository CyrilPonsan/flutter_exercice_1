import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'gnomeBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Exercice()
    );
  }
}

class Exercice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("gnomeBook"),
        elevation: 7.5,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  imageFromNetwork(size),
                  Padding(
                    padding: const EdgeInsets.only(top: 125),
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: profilePicture(50),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Spacer(),
                  Text(
                    "Prof. Firizgoude",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  Spacer()
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Un jour les gnomes domineront le monde, mais pas tout de suite, c'est l'heure du goûter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: buttonContainer(text: "Modifier le profil"),
                  ),
                  buttonContainer(icon: Icons.border_color)
                ],
              ),
              myDivider(),
              sectionTitleText("A propos de moi"),
              aboutRow(icon: Icons.house, text: 'Dalaran'),
              aboutRow(icon: Icons.work, text: 'Affliction Warlock'),
              aboutRow(icon: Icons.favorite, text: 'En couple avec ma succube'),
              myDivider(),
              sectionTitleText("Amis"),
              allFriends(width / 3.5),
              myDivider(),
              sectionTitleText("Mes Posts"),
              post(time: "5 minutes", image: "images/post.jpg", desc: "Visite chez Grand Ma"),
              post(time: "5 minutes", image: "images/post.jpg", desc: "Visite chez Grand Ma"),
              post(time: "5 minutes", image: "images/post.jpg", desc: "Visite chez Grand Ma"),
              post(time: "5 minutes", image: "images/post.jpg", desc: "Visite chez Grand Ma")
            ],
          ),
        ),
      ),
    );
  }

  Container post ({required String time, required image, required String desc, int likes = 0, int comments = 0}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              profilePicture(20),
              const Padding(
                padding: EdgeInsets.only(left: 8),
              ),
              const Text("Prof. Firizgoude"),
              const Spacer(),
              timeText(time)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Text(desc, style: const TextStyle(
            color: Colors.blueAccent
          ),),
          myDivider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.favorite),
              Text("$likes Likes"),
              const Icon(Icons.message),
              Text("$comments Commentaires")
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text("Il y a $time", style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),);
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "Gudule": "https://images.pexels.com/photos/5601140/pexels-photo-5601140.jpeg?cs=srgb&dl=pexels-a-koolshooter-5601140.jpg&fm=jpg",
      "Cunesgonde": "https://images.pexels.com/photos/5601140/pexels-photo-5601140.jpeg?cs=srgb&dl=pexels-a-koolshooter-5601140.jpg&fm=jpg",
      "Gertrude": "https://images.pexels.com/photos/5601140/pexels-photo-5601140.jpeg?cs=srgb&dl=pexels-a-koolshooter-5601140.jpg&fm=jpg"
    };
    List<Widget> children = [];
    friends.forEach((key, value) {
      children.add(friendsImage(key, value, width));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.grey)]
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(name),
        )
      ],
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }
  
  Divider myDivider() {
    return const Divider(
      height: 10,
      color: Colors.grey,
      thickness: 2,
    );
  }
  
  Widget sectionTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18
        ),
      ),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue
      ),
      child: (icon == null)
          ? Center(
              child: Text(text ?? "", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
            )
          : Icon(icon, color: Colors.white)
    );
  }

  CircleAvatar profilePicture(double radius) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: const AssetImage("images/gnome.png"),
      backgroundColor: Colors.white,
    );
  }

  Image imageFromNetwork(Size size) {
    return Image.network(
      'https://images.pexels.com/photos/7919/pexels-photo.jpg?cs=srgb&dl=pexels-life-of-pix-7919.jpg&fm=jpg&_gl=1*1fnrh8t*_ga*MTU0NjY0NTQxNS4xNjY3MDY1Nzg4*_ga_8JE65Q40S6*MTY2NzA2NTc4OC4xLjEuMTY2NzA2NzIxNy4wLjAuMA..',
      width: size.width,
    );
  }
}