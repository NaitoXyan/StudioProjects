import 'student.dart';
import 'head.dart';
import 'body.dart';
import 'text.dart';

void main() {
  Student(
    head: Head(
        name: Text('Your name'),
        mustache: false,
        hairColor: "Brown"
    ),
    body: Body(
      color: "Brown",
      height: 5.6,
      weight: 60.0,
      child:  Text('Brown'),
    ),
  );
}