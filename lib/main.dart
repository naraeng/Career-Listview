import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    'Dentist',
    'Account',
    'Lawyer',
    'Hairdresser',
    'School teacher',
    'Web developer',
    'Chef',
    'Professor',
    'Designer',
    'Doctor'
  ];

  var imageList = [
    'image/kitty1.png',
    'image/kitty2.png',
    'image/kitty3.png',
    'image/kitty4.png',
    'image/kitty5.png',
    'image/kitty6.png',
    'image/kitty7.png',
    'image/kitty8.png',
    'image/kitty9.png',
    'image/kitty10.png'
  ];

  var description = [
    '1. There are different types of careers. Which one will it be?',
    '2. There are different types of careers. Which one will it be?',
    '3. There are different types of careers. Which one will it be?',
    '4. There are different types of careers. Which one will it be?',
    '5. There are different types of careers. Which one will it be?',
    '6. There are different types of careers. Which one will it be?',
    '7. There are different types of careers. Which one will it be?',
    '8. There are different types of careers. Which one will it be?',
    '9. There are different types of careers. Which one will it be?',
    '10. There are different types of careers. Which one will it be?',
  ];

  void showPopup(context, title, image, descripton) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(children: [
                ClipRect(
                  child: Image.asset(
                    image,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Text(
                  //   description,
                  //   maxLines: 3,
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.grey[500],
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                  label: Text('close'),
                )
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ListView',
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print(titleList[index]);
                showPopup(context, titleList[index], imageList[index],
                    description[index]);
              },
              child: Card(
                  child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: width,
                              child: Text(
                                description[index],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[500]),
                              ))
                        ],
                      ))
                ],
              )),
            );
          },
        ));
  }
}
