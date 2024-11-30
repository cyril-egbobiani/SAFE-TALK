import 'package:encrypt/encrypt.dart';

class EncryptionService {
  final key = Key.fromUtf8('32characterslongsecretkey');  // Replace with secure key
  final iv = IV.fromLength(16);

  String encryptMessage(String text) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decryptMessage(String text) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(text, iv: iv);
    return decrypted;
  }
}
