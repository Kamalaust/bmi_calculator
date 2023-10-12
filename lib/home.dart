import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _weight = 0;
  double _height = 0;
  double result = 0;

  void calculateBMI() {
    double heightSquare = _height * _height;
    result = _weight / heightSquare;
    setState(() {});

    print(result);
  }

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
                Text("${_height.toStringAsFixed(1)} CM",
                    style: TextStyle(color: Colors.white)),
                Slider(
                  activeColor: Colors.grey,
                  inactiveColor: Colors.blue,
                  thumbColor: Colors.pink,
                  min: 0,
                  max: 190,
                  value: _height,
                  // value: _value,
                  onChanged: (value) {
                    setState(() {
                      _height = value;
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
              calculateBMI();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Container(
                    color: Color(0xff1F1D35),
                    child: Column(
                      children: [
                        Text("YOUR BMI IS: ${result.toStringAsFixed(6)}",
                            style: TextStyle(color: Colors.white)),
                        if (result < 18.5)
                          Text('Underweight',
                              style: TextStyle(color: Colors.white)),
                        if (result > 18.5 && result < 24.9)
                          Text('Normalweight',
                              style: TextStyle(color: Colors.white)),
                        if (result > 25 && result < 29.9) Text('Overweight'),
                        if (result >= 30)
                          Text('obesity',
                              style: TextStyle(color: Colors.white)),
                        Text("Underweight less than 18.5",
                            style: TextStyle(color: Colors.white)),
                        Text("Normal weight 18.5-24.9",
                            style: TextStyle(color: Colors.white)),
                        Text("Over weight 25-29.9",
                            style: TextStyle(color: Colors.white)),
                        Text("Obesity 30 or greater",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ));
                },
              );
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
