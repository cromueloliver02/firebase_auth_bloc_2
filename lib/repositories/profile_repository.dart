import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;

  ProfileRepository({
    required this.firebaseFirestore,
  });

  Future<User> fetchProfile(String uid) async {
    try {
      final DocumentSnapshot userDoc = await kUsersCollection.doc(uid).get();

      if (!userDoc.exists) throw '404: User not found';

      final user = User.fromDocument(userDoc);

      return user;
    } on FirebaseException catch (err) {
      throw CustomError(
        code: err.code,
        plugin: err.plugin,
        message: err.message!,
      );
    } catch (err) {
      throw CustomError(
        code: 'Exception',
        plugin: 'flutter_error/server_error',
        message: err.toString(),
      );
    }
  }
}
