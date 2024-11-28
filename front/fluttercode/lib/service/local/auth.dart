import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalAuthService {
  final _storage = FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  Future<String?> getSecureToken(String token) async {
    return await _storage.read(key: "token");
  }

  Future<void> storeCpfClient(String CpfClient) async {
    await _storage.write(key: "cpfClient", value: CpfClient);
  }

  Future<String?> getCpfClient(String CpfClient) async {
    return await _storage.read(key: "cpfClient");
  }

  Future storeAccount({
    required String email,
    required String fullname,
    required int id,
  }) async {
    await _storage.write(key: "id", value: id.toString());
    await _storage.write(key: "email", value: email);
    await _storage.write(key: "fullname", value: fullname);
  }

  Future<String?> getEmail(String unicKey) async {
    return await _storage.read(key: "email");
  }

  Future<String?> getId(String unicKey) async {
    return await _storage.read(key: "id");
  }

  Future<String?> getFullName(String unicKey) async {
    return await _storage.read(key: "fullname");
  }

  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      print('Erro ao apagar dados: $e');
    }
  }
}
