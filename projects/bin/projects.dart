// Fnal examinations projects level 5 semister 1

// registration number JRIIT/DIT/034
// 
// 



import 'dart:io';
import 'package:projects/models/user.dart';
import 'package:projects/services/user_services.dart';

void main() async {
  UserService userService = UserService();

  print(
      'select from the following selections to do add or delete and update data in database');
  print("""
         1. Add user Informations.
         2. Show user informations.
         3. Edit user informations. 
         4. Delete user informations.
      """);
  final select = stdin.readLineSync();
  if (select == '1') {
    await addUserInfo(userService);
  } else if (select == '2') {
    await getUsersInfo(userService);
  } else if (select == '3') {
    await updateUserInfo(userService);
  } else if (select == '4') {
    await deleteUserInfo(userService);
  } else {
    print('not on the list');
  }
}

Future<void> addUserInfo(UserService userService) async {
  print('enter User informations');
  print('what is your Full name');
  final fullname = stdin.readLineSync();
  print('Enter your Gender');
  final gender = stdin.readLineSync();
  print('Input your email address');
  final email = stdin.readLineSync();
  print('Which country are you coming from');
  final country = stdin.readLineSync();
  print('whhich city are you coming from?');
  final city = stdin.readLineSync();
  print('Describe yourself who are?');
  final descriptions = stdin.readLineSync();
  if (fullname != null &&
      gender != null &&
      email != null &&
      country != null &&
      city != null &&
      descriptions != null) {
    User newUserInfo = User(
      id: 0,
      fullname: fullname,
      gender: gender,
      email: email,
      city: city,
      country: country,
      descriptions: descriptions,
    );
    await userService.addUserInfo(newUserInfo);
    print('User added successfully');
  } else {
    print('Invalid user informations');
  }
}

Future<void> getUsersInfo(UserService userService) async {
  List<User> users = await userService.getUsersInfo();
  for (User user in users) {
    print("""User: ${user.id}, FullName: ${user.fullname},
     Gender:${user.gender} Email: ${user.email}
     City:${user.city} County:${user.country} description:${user.descriptions}
     """);
  }
}

Future<void> updateUserInfo(UserService userService) async {
  print('what is the id of the user you want to edit their informations');
  final id = stdin.readLineSync();
  if (id== null) {
    print('Invalid user ID.');
    return;
  }
  var userid = int.parse(id);
  print('enter User informations');
  print('what is your Full name');
  final fullname = stdin.readLineSync();
  print('Enter your Gender');
  final gender = stdin.readLineSync();
  print('Input your email address');
  final email = stdin.readLineSync();
  print('Which country are you coming from');
  final country = stdin.readLineSync();
  print('whhich city are you coming from?');
  final city = stdin.readLineSync();
  print('Describe yourself who are?');
  final descriptions = stdin.readLineSync();
  if (fullname != null &&
      gender != null &&
      email != null &&
      country != null &&
      city != null &&
      descriptions != null) {
    User updatedUser = User(
      id: userid,
      fullname: fullname,
      gender: gender,
      email: email,
      city: city,
      country: country,
      descriptions: descriptions,
    );
    await userService.updateUserInfo(updatedUser);
    print('User informations updated successfully');
  }
}

Future<void> deleteUserInfo(UserService userService) async {
  print('what is the id of the user you want to delete their informations');
  final userId = stdin.readLineSync();
  if (userId== null) {
    print('Invalid user ID.');
    return;
  }
  var id = int.parse(userId);
  await userService.deleteUserInfo(id);
  print('User deleted successfully');
}
