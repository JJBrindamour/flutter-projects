import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Learn Flutter'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/image.jpg'),
              SizedBox(
                height: 4,
              ),
              Divider(
                color: Colors.black,
                thickness: 4,
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                // color: Colors.blueGrey,
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    'This is a text widget',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    debugPrint('Elevated Button Pressed');
                  },
                  child: Text('Elevated Button')),
              OutlinedButton(
                  onPressed: () {
                    debugPrint('Outlined Button Pressed');
                  },
                  child: Text('Outlined Button')),
              TextButton(
                  onPressed: () {
                    debugPrint('Text Button Pressed');
                  },
                  child: Text('Text Button')),
              GestureDetector(
                onTap: () {
                  debugPrint('Geture Detected');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.local_fire_department),
                    Text('Row Widget'),
                    Icon(Icons.local_fire_department),
                  ],
                ),
              ),
              Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                },
              ),
              Checkbox(
                value: isCheck,
                onChanged: (bool? newBool) {
                  setState(() {
                    isCheck = newBool;
                  });
                },
              ),
              Image.network('https://wallpaperaccess.com/full/1909531.jpg')
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          debugPrint('Action');
        },
        icon: Icon(Icons.info_outlined),
        color: Colors.white,
      ),
    );
  }
}
