import 'package:mysql1/mysql1.dart';
import 'package:projects/config/dbconfig.dart';

class DBConnect {
  static Future<MySqlConnection> getDbConnection() async {
    final connectionSettings = ConnectionSettings(
      host:Settings.host,
      port: Settings.port,
      user: Settings.user,
      db: Settings.db,
      password: Settings.password,
    );
    return await MySqlConnection.connect(connectionSettings);
  }
}
