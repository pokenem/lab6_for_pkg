import 'dart:math';

import 'package:ditredi/ditredi.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Letter {
  List<(vector.Vector3, vector.Vector3)> let = [
    (vector.Vector3(0, 0, 0), vector.Vector3(4, 0, 0)),
    (vector.Vector3(4, 0, 0), vector.Vector3(4, 2, 0)),
    (vector.Vector3(4, 2, 0), vector.Vector3(2, 2, 0)),
    (vector.Vector3(2, 2, 0), vector.Vector3(2, 4, 0)),
    (vector.Vector3(2, 4, 0), vector.Vector3(4, 4, 0)),
    (vector.Vector3(4, 4, 0), vector.Vector3(4, 6, 0)),
    (vector.Vector3(4, 6, 0), vector.Vector3(0, 6, 0)),
    (vector.Vector3(0, 6, 0), vector.Vector3(0, 0, 0)),
    (vector.Vector3(0, 6, 0), vector.Vector3(0, 6, 2)),
    (vector.Vector3(0, 6, 2), vector.Vector3(4, 6, 2)),
    (vector.Vector3(4, 6, 2), vector.Vector3(4, 6, 0)),
    (vector.Vector3(4, 6, 2), vector.Vector3(4, 4, 2)),
    (vector.Vector3(4, 4, 2), vector.Vector3(4, 4, 0)),
    (vector.Vector3(4, 4, 2), vector.Vector3(2, 4, 2)),
    (vector.Vector3(2, 4, 2), vector.Vector3(2, 4, 0)),
    (vector.Vector3(2, 4, 2), vector.Vector3(2, 2, 2)),
    (vector.Vector3(2, 2, 2), vector.Vector3(2, 2, 0)),
    (vector.Vector3(2, 2, 2), vector.Vector3(4, 2, 2)),
    (vector.Vector3(4, 2, 2), vector.Vector3(4, 2, 0)),
    (vector.Vector3(4, 2, 2), vector.Vector3(4, 0, 2)),
    (vector.Vector3(4, 0, 2), vector.Vector3(4, 0, 0)),
    (vector.Vector3(4, 0, 2), vector.Vector3(0, 0, 2)),
    (vector.Vector3(0, 0, 2), vector.Vector3(0, 0, 0)),
    (vector.Vector3(0, 0, 2), vector.Vector3(0, 6, 2)),
  ];

  void moreSize() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x * 1.1, it.$1.y * 1.1, it.$1.z * 1.1), vector.Vector3(it.$2.x * 1.1, it.$2.y * 1.1, it.$2.z * 1.1));
    }
  }

  void lessSize() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x / 1.1, it.$1.y / 1.1, it.$1.z / 1.1), vector.Vector3(it.$2.x / 1.1, it.$2.y / 1.1, it.$2.z / 1.1));
    }
  }

  void plusX() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x + 1, it.$1.y, it.$1.z), vector.Vector3(it.$2.x + 1, it.$2.y, it.$2.z));
    }
  }

  void minusX() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x - 1, it.$1.y, it.$1.z), vector.Vector3(it.$2.x - 1, it.$2.y, it.$2.z));
    }
  }

  void plusY() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x, it.$1.y + 1, it.$1.z), vector.Vector3(it.$2.x, it.$2.y + 1, it.$2.z));
    }
  }

  void minusY() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x, it.$1.y - 1, it.$1.z), vector.Vector3(it.$2.x, it.$2.y - 1, it.$2.z));
    }
  }

  void plusZ() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x, it.$1.y, it.$1.z + 1), vector.Vector3(it.$2.x, it.$2.y, it.$2.z + 1));
    }
  }

  void minusZ() {
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (vector.Vector3(it.$1.x, it.$1.y, it.$1.z - 1), vector.Vector3(it.$2.x, it.$2.y, it.$2.z - 1));
    }
  }

  void rotateX() {
    List<List<double>> l = [
      [1, 0, 0],
      [0, cos(vector.radians(10)), -sin(vector.radians(10))],
      [0, sin(vector.radians(10)), cos(vector.radians(10))]
    ];
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (
        vector.Vector3(it.$1.x * l[0][0] + it.$1.y * l[0][1] + it.$1.z * l[0][2],
            it.$1.x * l[1][0] + it.$1.y * l[1][1] + it.$1.z * l[1][2],
            it.$1.x * l[2][0] + it.$1.y * l[2][1] + it.$1.z * l[2][2]),
        vector.Vector3(it.$2.x * l[0][0] + it.$2.y * l[0][1] + it.$2.z * l[0][2],
            it.$2.x * l[1][0] + it.$2.y * l[1][1] + it.$2.z * l[1][2],
            it.$2.x * l[2][0] + it.$2.y * l[2][1] + it.$2.z * l[2][2])
      );
    }
  }
  void rotateY(){
    List<List<double>> l = [
      [cos(vector.radians(10)), 0, sin(vector.radians(10))],
      [0, 1, 0],
      [-sin(vector.radians(10)), 0 , cos(vector.radians(10))]
    ];
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (
      vector.Vector3(it.$1.x * l[0][0] + it.$1.y * l[0][1] + it.$1.z * l[0][2],
          it.$1.x * l[1][0] + it.$1.y * l[1][1] + it.$1.z * l[1][2],
          it.$1.x * l[2][0] + it.$1.y * l[2][1] + it.$1.z * l[2][2]),
      vector.Vector3(it.$2.x * l[0][0] + it.$2.y * l[0][1] + it.$2.z * l[0][2],
          it.$2.x * l[1][0] + it.$2.y * l[1][1] + it.$2.z * l[1][2],
          it.$2.x * l[2][0] + it.$2.y * l[2][1] + it.$2.z * l[2][2])
      );
    }
  }
  void rotateZ(){
    List<List<double>> l = [
      [cos(vector.radians(10)), -sin(vector.radians(10)), 0],
      [sin(vector.radians(10)), cos(vector.radians(10)), 0],
      [0, 0, 1]
    ];
    for (int i = 0; i < let.length; i++) {
      (vector.Vector3, vector.Vector3) it = let[i];
      let[i] = (
      vector.Vector3(it.$1.x * l[0][0] + it.$1.y * l[0][1] + it.$1.z * l[0][2],
          it.$1.x * l[1][0] + it.$1.y * l[1][1] + it.$1.z * l[1][2],
          it.$1.x * l[2][0] + it.$1.y * l[2][1] + it.$1.z * l[2][2]),
      vector.Vector3(it.$2.x * l[0][0] + it.$2.y * l[0][1] + it.$2.z * l[0][2],
          it.$2.x * l[1][0] + it.$2.y * l[1][1] + it.$2.z * l[1][2],
          it.$2.x * l[2][0] + it.$2.y * l[2][1] + it.$2.z * l[2][2])
      );
    }
  }

  List<(vector.Vector3, vector.Vector3)> getProectionXY() {
    List<(vector.Vector3, vector.Vector3)> list = [...let];
    for (int i = 0; i < list.length; i++) {
      (vector.Vector3, vector.Vector3) it = list[i];
      list[i] = (vector.Vector3(it.$1.x, it.$1.y, 0), vector.Vector3(it.$2.x, it.$2.y, 0));
    }
    return list;
  }

  List<(vector.Vector3, vector.Vector3)> getProectionXZ() {
    List<(vector.Vector3, vector.Vector3)> list = [...let];
    for (int i = 0; i < list.length; i++) {
      (vector.Vector3, vector.Vector3) it = list[i];
      list[i] = (vector.Vector3(it.$1.x, 0, it.$1.z), vector.Vector3(it.$2.x, 0, it.$2.z));
    }
    return list;
  }

  List<(vector.Vector3, vector.Vector3)> getProectionYZ() {
    List<(vector.Vector3, vector.Vector3)> list = [...let];
    for (int i = 0; i < list.length; i++) {
      (vector.Vector3, vector.Vector3) it = list[i];
      list[i] = (vector.Vector3(0, it.$1.y, it.$1.z), vector.Vector3(0, it.$2.y, it.$2.z));
    }
    return list;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3D Object',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '3D Object'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int flag = 0;
  final _controller = DiTreDiController(
    light: vector.Vector3(-0.5, -0.5, 0.5),
  );
  var letter = Letter();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: [
            DiTreDiDraggable(
              controller: _controller,
              child: DiTreDi(
                figures: [
                  for(double i = -20; i <= 20; i++)
                    Line3D(vector.Vector3(-0.3, 0, i), vector.Vector3(0.3, 0, i), width: 2, color: Colors.purple),
                  for(double i = -20; i <= 20; i++)
                    Line3D(vector.Vector3(-0.3, i, 0), vector.Vector3(0.3, i, 0), width: 2, color: Colors.purple),
                  for(double i = -20; i <= 20; i++)
                    Line3D(vector.Vector3(i, 0, -0.3), vector.Vector3(i, 0, 0.3), width: 2, color: Colors.purple),
                  //z coordinate line
                  Line3D(vector.Vector3(0, 0, -20), vector.Vector3(0, 0, 20), width: 2),
                  Line3D(vector.Vector3(2, -2, 20), vector.Vector3(-2, 2, 20), width: 5),
                  Line3D(vector.Vector3(-2, 2, 20), vector.Vector3(2, 2, 20), width: 5),
                  Line3D(vector.Vector3(2, -2, 20), vector.Vector3(-2, -2, 20), width: 5),
                  //y coordinate line
                  Line3D(vector.Vector3(0, -20, 0), vector.Vector3(0, 20, 0), width: 2),
                  Line3D(vector.Vector3(2, 20, -2), vector.Vector3(-2, 20, 2), width: 5),
                  Line3D(vector.Vector3(0, 20, 0), vector.Vector3(-2, 20, -2), width: 5),
                  //x coordinate line
                  Line3D(vector.Vector3(-20, 0, 0), vector.Vector3(20, 0, 0), width: 2),
                  Line3D(vector.Vector3(20, 2, -2), vector.Vector3(20, -2, 2), width: 5),
                  Line3D(vector.Vector3(20, -2, -2), vector.Vector3(20, 2, 2), width: 5),
                  if (flag == 0)
                    for (dynamic it in letter.let) Line3D(it.$1, it.$2, width: 5, color: Colors.redAccent)
                  else if (flag == 1)
                    for (dynamic it in letter.getProectionXY()) Line3D(it.$1, it.$2, width: 5, color: Colors.redAccent)
                  else if (flag == 2)
                    for (dynamic it in letter.getProectionXZ()) Line3D(it.$1, it.$2, width: 5, color: Colors.redAccent)
                  else if (flag == 3)
                    for (dynamic it in letter.getProectionYZ()) Line3D(it.$1, it.$2, width: 5, color: Colors.redAccent)
                ],
                controller: _controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.moreSize();
                    });
                  },
                  child: Text("+Size")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.lessSize();
                    });
                  },
                  child: Text("-Size")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 70,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.plusX();
                    });
                  },
                  child: Text("+X")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 70,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.minusX();
                    });
                  },
                  child: Text("-X")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 120,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.plusY();
                    });
                  },
                  child: Text("+Y")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 120,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.minusY();
                    });
                  },
                  child: Text("-Y")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 170,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.plusZ();
                    });
                  },
                  child: Text("+Z")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 110,
                top: 170,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.minusZ();
                    });
                  },
                  child: Text("-Z")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 220,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.rotateX();
                    });
                  },
                  child: Text("Rotate X 10 degree")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 270,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.rotateY();
                    });
                  },
                  child: Text("Rotate Y 10 degree")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 320,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      letter.rotateZ();
                    });
                  },
                  child: Text("Rotate Z 10 degree")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 520,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: Text("3D Figure")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 370,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 1;
                    });
                  },
                  child: Text("XY Proection")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 420,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 2;
                    });
                  },
                  child: Text("XZ Proection")),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 470,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag = 3;
                    });
                  },
                  child: Text("YZ Proection")),
            ),
          ],
        ),
      ),
    );
  }
}
