import 'dart:convert';
import 'dart:io';
import 'package:Consult/service/remote/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart'; // Você pode adicionar este pacote para gerar UUIDs únicas

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  String? urlEnv = dotenv.env["BASEURL"];

  @override
  void onInit() async {
    super.onInit();
  }

  void signUp({
    required String fullname,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      // Mostrar loading
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      // Chamar o serviço de autenticação para registrar o usuário
      var result = await RemoteAuthService().signUp(
        email: email,
        username: username,
        password: password,
      );

      // Verificar se a resposta foi bem-sucedida
      if (result.statusCode == 200) {
        // Extrair o token JWT da resposta
        String token = json.decode(result.body)['jwt'];

        // Fazer a requisição para criar o perfil
        var userResult = await RemoteAuthService().createProfile(
          fullname: fullname,
          token: token,
        );

        // Verificar se a criação do perfil foi bem-sucedida
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Conta criada. Confirme suas informações.");
          // Redirecionar para a tela de login
          Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
        } else {
          // Mostrar erro se a criação do perfil falhou
          EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
        }
      } else {
        // Mostrar erro se o registro do usuário falhou
        EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
      }
    } catch (e) {
      // Mostrar erro em caso de exceção
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      // Fechar o loading
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      // Faz a chamada para signIn
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );

      if (result.statusCode == 200) {
        // Pega o token do corpo da resposta
        String token = json.decode(result.body)['jwt'];

        // Faz a chamada para getProfile
        var userResult = await RemoteAuthService().getProfile(token: token);

        if (userResult.statusCode == 200) {
          // Decodifica o corpo da resposta (apenas depois de checar o statusCode)
          var userData = jsonDecode(userResult.body);

          var email = userData['email'];
          var id = userData['id'];
          var fullname = userData['fullname'];
          var cpf = userData['user']['username'];
          var idInterprise = userData['enterprise']['id'];

          print(idInterprise);

          user.value = userFromJson(userResult.body);

          await LocalAuthService().storeToken(token);
          await LocalAuthService().storeAccount(
            id: id,
            email: email,
            fullname: fullname,
            cpf: cpf,
            idInterprise: idInterprise,
          );

          EasyLoading.showSuccess("Bem vindo ao Benefeer");
          Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
        } else {
          EasyLoading.showError(
              'Alguma coisa deu errado. Tente novamente mais tarde...');
        }
      } else {
        EasyLoading.showError('Email ou senha incorreto.');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void posting({
    required String title,
    required String desc,
    required String content,
    required int profileId,
    required bool public,
    // required int chunkId,
    String? fileName,
    // List<int>? selectFile
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var token = await LocalAuthService().getSecureToken("token");
      var result = await RemoteAuthService().addPost(
        token: token.toString(),
        title: title,
        desc: desc,
        content: content,
        profileId: profileId,
        public: public,
      );
      EasyLoading.showSuccess("Seu relato poster enviado.");
      Navigator.of(Get.overlayContext!).pushReplacementNamed('/');

      // if (result.statusCode == 200) {
      //   int postId = json.decode(result.body)['id'];
      //   var url = Uri.parse('$urlEnv/upload');
      //   var request = http.MultipartRequest("POST", url);
      //   request.files.add(await http.MultipartFile.fromBytes(
      //     'files',
      //     selectFile!,
      //     contentType: MediaType('application', 'pdf'),
      //     filename: fileName ?? "Benefeer File",
      //   ));

      //   request.files.add(await http.MultipartFile.fromString("ref", "post"));
      //   request.files
      //       .add(await http.MultipartFile.fromString("refId", "${postId}"));

      //   request.files
      //       .add(await http.MultipartFile.fromString("field", "files"));

      //   request.headers.addAll({"Authorization": "Bearer $token"});
      //   request.send().then((response) {
      //     if (response.statusCode == 200) {
      //       print("FileUpload Successfuly");
      //     } else {
      //       print("FileUpload Error");
      //     }
      //   });
      // }
    } catch (e) {
      print(e);
      EasyLoading.showError('Alguma coisa deu errado.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<Map<String, String?>?> iniciarPagamentoMercadoPago(
      double valor) async {
    var uuid = Uuid();
    String idempotencyKey = uuid.v4();

    final url = Uri.parse("https://api.mercadopago.com/v1/payments");

    final response = await http.post(
      url,
      headers: {
        "Authorization":
            "Bearer APP_USR-2869162016512406-102909-f6e7d456e301fbb93bc5fb67004f8e5b-1983614734",
        "X-Idempotency-Key": idempotencyKey,
      },
      body: jsonEncode({
        "transaction_amount": valor,
        "description": "Acesso especial",
        "payment_method_id": "pix",
        "payer": {"email": "mmessiasdev@gmail.com"}
      }),
    );

    if (response.statusCode == 201) {
      final paymentResponse = jsonDecode(response.body);
      final qrCodeBase64 = paymentResponse['point_of_interaction']
          ['transaction_data']['qr_code_base64'];
      final qrCodeCopyPaste = paymentResponse['point_of_interaction']
          ['transaction_data']['qr_code'];
      final paymentId = paymentResponse['id']
          .toString(); // ID do pagamento para futuras verificações

      return {
        "qrCodeBase64": qrCodeBase64,
        "qrCodeCopyPaste": qrCodeCopyPaste,
        "paymentId": paymentId,
      };
    } else {
      print("Erro no pagamento: ${response.statusCode}");
      return null;
    }
  }

  Future<bool> verificarStatusPagamento(String paymentId) async {
    final url = Uri.parse("https://api.mercadopago.com/v1/payments/$paymentId");

    final response = await http.get(
      url,
      headers: {
        "Authorization":
            "Bearer APP_USR-2869162016512406-102909-f6e7d456e301fbb93bc5fb67004f8e5b-1983614734",
      },
    );

    if (response.statusCode == 200) {
      final paymentResponse = jsonDecode(response.body);
      print(paymentResponse['status']);

      // Verifique se o status do pagamento é "approved"
      if (paymentResponse['status'] == "approved") {
        return true; // Retorna true se o status for "approved"
      } else {
        print("Pagamento não aprovado. Status: ${paymentResponse['status']}");
        return false; // Retorna false se o status não for "approved"
      }
    } else {
      print("Erro ao verificar o status: ${response.statusCode}");
      return false; // Retorna false se o status code não for 200
    }
  }

  Future<void> uploadImageToStrapi({
    required String token,
    required String profileId,
    required String localStoreId,
    required String filePath, // Caminho da imagem
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var token = await LocalAuthService().getSecureToken("token");
      var result = await RemoteAuthService().addVerificationLocalStore(
        token: token.toString(),
        profile: int.tryParse(profileId),
        local_store: int.tryParse(localStoreId),
      );
      EasyLoading.showSuccess("Seu relato poster enviado.");
      Navigator.of(Get.overlayContext!).pushReplacementNamed('/');

      if (result.statusCode == 200) {
        print("POST REALIZADO. PROCURANDO COMPROVANTE");
        // Extrair o ID do 'receipt' da resposta
        var responseData = json.decode(result.body);
        int receiptId =
            responseData['id']; // Ajuste conforme a estrutura da resposta

        // Criar uma instância de arquivo da imagem
        File imageFile = File(filePath);
        String fileName = imageFile.path.split('/').last;

        // Construir a URL da API Strapi para o endpoint de upload
        var url = Uri.parse('$urlEnv/upload');

        // Criar a requisição Multipart
        var request = http.MultipartRequest('POST', url);

        // Adicionar o arquivo como multipart
        request.files.add(
          await http.MultipartFile.fromPath(
            'files', // Nome do campo no body que contém o arquivo
            imageFile.path,
            contentType: MediaType('image', 'jpeg'), // ou 'png' conforme o tipo
            filename: fileName,
          ),
        );

        // Adicionar os outros campos do content-type VerifiquedBuyLocalStore
        request.fields['ref'] = 'verifiqued-buy-local-store';
        request.fields['refId'] =
            receiptId.toString(); // ID do registro no Strapi
        request.fields['field'] =
            'receipt'; // Nome do campo da imagem no Strapi

        // Adicionar o cabeçalho de autorização com o token
        request.headers['Authorization'] = 'Bearer $token';

        // Enviar a requisição
        var response = await request.send();

        // Verificar a resposta
        if (response.statusCode == 200) {
          print("Upload bem-sucedido!");
        } else {
          print("Erro no upload: ${response.statusCode}");
        }
      } else {
        print("Erro: Não foi possivel verificar informações da conta.");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }

  void signOut() async {
    user.value = null;
    await LocalAuthService().clear();
    Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
  }
}
