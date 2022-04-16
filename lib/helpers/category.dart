import 'package:get/get.dart';

class Category extends GetxController {
  static Category one = Category(
    'Star Louge And Bar',
  );
  static Category two = Category(
    'Starlink and Bar',
  );
  static Category three = Category(
    'Burna Bar',
  );

  static Category four = Category(
    'Fela Bar',
  );
  // static Category five = Category(
  //   '5:00 am',
  // );
  // static Category six = Category(
  //   '6:00 am',
  // );
  // static Category seven = Category(
  //   '7:00 am',
  // );
  // static Category eight = Category(
  //   '8:00 am',
  // );
  // static Category nine = Category(
  //   '9:00 am',
  // );
  // static Category ten = Category(
  //   '10:00 am',
  // );
  // static Category eleven = Category(
  //   '11:00 am',
  // );
  // static Category twelve = Category(
  //   '12:00 pm',
  // );
  // static Category thirteen = Category(
  //   '1:00 pm',
  // );
  // static Category fourteen = Category(
  //   '2:00 pm',
  // );
  // static Category fifteen = Category(
  //   '3:00 pm',
  // );
  // static Category sixteen = Category(
  //   '4:00 pm',
  // );
  // static Category seventeen = Category(
  //   '5:00 pm',
  // );
  // static Category eightheen = Category(
  //   '6:00 pm',
  // );
  // static Category nineteen = Category(
  //   '7:00 pm',
  // );
  // static Category twenty = Category(
  //   '8:00 pm',
  // );
  // static Category twentyone = Category(
  //   '9:00 pm',
  // );
  // static Category twentytwo = Category(
  //   '10:00 pm',
  // );
  // static Category twentythree = Category(
  //   '11:00 pm',
  // );
  // static Category twentyfour = Category(
  //   '12:00 am',
  // );

  final String name;
  Category(this.name);

  static final values = [
    Category.one,
    Category.two,
    Category.three,
    Category.four,
    // Category.five,
    // Category.six,
    // Category.seven,
    // Category.eight,
    // Category.nine,
    // Category.ten,
    // Category.eleven,
    // Category.twelve,
    // Category.thirteen,
    // Category.fourteen,
    // Category.fifteen,
    // Category.sixteen,
    // Category.seventeen,
    // Category.eightheen,
    // Category.nineteen,
    // Category.twenty,
    // Category.twentyone,
    // Category.twentytwo,
    // Category.twentythree,
    // Category.twentyfour,
  ].obs;
}
