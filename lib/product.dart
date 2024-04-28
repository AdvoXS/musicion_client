//import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

void main() {

}
void classes(){
  var p = Point.origin(2, 3); //call named constructor
  var q = Point()
    ..x = 4
    ..y = 3; //cascade notation

  var qq = Point3D.point2d(x: 2, y: 3);
  const FixedPoint2D f = FixedPoint2D(x: 2, y: 3);
  var f1 = const FixedPoint2D(x: 2, y: 3);
  var plusResult = f1+f;
}
void list(){
  var name = 'Musicion';
  var names = ['Musicion', 'MUSICion', 'MusicION'];


  var l = <String>[];
  l.add('1');
  print(l);
  var list = [1, 2, 3];
  list.add(4);
}
void records(){
  ({int a, int b}) record = (a: 1, b: 2);
  (int a, int b) record1 = (1, 2);
  print('$record1.a $record1.b');
  print('$record.a $record.2');
}

Function add(int add) {
  return (num i) => i + add;
}

class Point {
  int? y;
  int? x;

  Point({this.y, this.x});

  Point.origin(this.y, this.x);
}

class Point3D extends Point {
  int? z;

  Point3D({super.x, super.y, this.z});

  Point3D.fromRes({x, y, this.z})
      : super(x: x, y: y); // named constructor same as constructor upper

  Point3D.point2d({x, y})
      : this(x: x, y: y, z: 0); //named and redirect constructor
}

class FixedPoint2D {
  final double x;
  final double y;

  const FixedPoint2D(
      {required this.x,
      required this.y}); // const constructor. Vars must be final. Class object would be const

  FixedPoint2D operator +(FixedPoint2D second) =>
      FixedPoint2D(x: x + second.x, y: y + second.y);
}
