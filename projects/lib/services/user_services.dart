import 'package:mysql1/mysql1.dart';
import '../db/dbconection.dart';
import '../models/user.dart';

class UserService {
  Future<List<User>> getUsersInfo() async {
    MySqlConnection conn = await DBConnect.getDbConnection();
    List<User> users = [];
    try {
      var results = await conn.query('SELECT * FROM users');
      for (var row in results) {
        users.add(User(
            id: row[0],
            fullname: row[1],
            gender: row[2],
            email: row[3],
            city: row[4],
            country: row[5],
            descriptions: row[6]));
      }
    } finally {
      await conn.close();
    }
    return users;
  }

  Future<void> addUserInfo(User user) async {
    MySqlConnection conn = await DBConnect.getDbConnection();
    try {
      await conn.query(
          'INSERT INTO users (fullname,gender,email,city,country,descriptions) VALUES (?, ?,?,?,?,?)',
          [
            user.fullname,
            user.gender,
            user.email,
            user.country,
            user.city,
            user.descriptions
          ]);
    } finally {
      await conn.close();
    }
  }

  Future<void> updateUserInfo(User user) async {
    MySqlConnection conn = await DBConnect.getDbConnection();
    try {
      await conn.query(
          'UPDATE users SET fullname = ?, email = ?,gender=?,country=?,city=?,descriptions=? WHERE id = ?',
          [
            
            user.fullname,
            user.gender,
            user.email,
            user.country,
            user.city,
            user.descriptions,
            user.id,
          ]);
    } finally {
      await conn.close();
    }
  }

  Future<void> deleteUserInfo(int id) async {
    MySqlConnection conn = await DBConnect.getDbConnection();
    try {
      await conn.query('DELETE FROM users WHERE id = ?', [id]);
    } finally {
      await conn.close();
    }
  }
}
