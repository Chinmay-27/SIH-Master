import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class MongoDataBase {
  static get db => null;

  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
  }

  // Function to authenticate user by email and password
  static Future<bool> authenticateUser(String email, String password) async {
    try {
      // Open connection to the database
      var db = await Db.create(MONGO_URL);
      await db.open();

      var collection = db.collection(COLLECTION_NAME);

      // Query for user by matching email and password
      var user = await collection.findOne({"email": email, "password": password});

      if (user != null) {
        // Login successful
        return true;
      } else {
        // Login failed
        return false;
      }
    } catch (e) {
      print("Error during authentication: $e");
      return false;
    } finally {
      // Ensure that the database connection is closed after the operation
      await db.close();
    }
  }
}
