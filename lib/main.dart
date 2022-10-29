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
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  imageFromNetwork(size),
                  Padding(
                    padding: const EdgeInsets.only(top: 125),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 53,
                          backgroundColor: Colors.white,
                        ),
                        profilePicture(50)
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                "Prof. Firizgoude",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic
                ),
              ),
              const Text(
                "Un jour les gnomes domineront le monde, mais pas tout de suite, c'est l'heure du goûter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              const Divider(
                height: 20,
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    width: size.width / 2,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: const Center(
                      child: Text(
                          "Modifier le profil",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ),
                  Container(
                    height: 50,
                    width: 65,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
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