import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 0;
  double _weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C0D23),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff0C0D23),
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff1F1D35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male, color: Colors.white),
                    Text("Male", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff1F1D35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.female, color: Colors.white),
                    Text("Female", style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff1F1D35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height", style: TextStyle(color: Colors.white)),
                Text("${_value.toStringAsFixed(1)} CM",
                    style: TextStyle(color: Colors.white)),
                Slider(
                  activeColor: Colors.grey,
                  inactiveColor: Colors.blue,
                  thumbColor: Colors.pink,
                  min: 0,
                  max: 190,
                  value: _value,
                  // value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff1F1D35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Weight", style: TextStyle(color: Colors.white)),
                Text("$_weight", style: TextStyle(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _weight++;
                        setState(() {});
                      },
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child:
                              Text("+", style: TextStyle(color: Colors.white))),
                    ),
                    InkWell(
                      onTap: () {
                        if (_weight >= 1) _weight--;

                        setState(() {});
                      },
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child:
                              Text("-", style: TextStyle(color: Colors.white))),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print("clicked");
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.pink,
              child: Text(
                "CALCULATE",
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
        ]),
      ),
    );
  }
}
