import 'package:Consult/service/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  var token;

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");

    // var strCpf = await LocalAuthService().getCpf("cpf");

    // Verifique se o widget ainda está montado antes de chamar setState
    if (mounted) {
      setState(() {
        // Caso strCpf seja null, passamos uma string vazia
        // cpf.text = strCpf ?? ''; // Usa uma string vazia se strCpf for null
        token = strToken;
      });
    }
  }

  @override
  void dispose() {
    token.dispose();
    super.dispose();
  }

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();

  List<Map<String, String>> videos = [];
  final TextEditingController _videoTitleController = TextEditingController();
  final TextEditingController _videoDescriptionController =
      TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();

  String apiUrl =
      "https://2ee4-2a09-bac5-633-1c96-00-2d9-1a.ngrok-free.app/courses"; // Substitua pelo URL da sua API

  Future<void> sendCourse() async {
    print(token.toString());
    try {
      // 1. Cria os vídeos e salva os IDs gerados
      List<int> videoIds = [];
      for (var video in videos) {
        final videoResponse = await http.post(
          Uri.parse(
              "https://2ee4-2a09-bac5-633-1c96-00-2d9-1a.ngrok-free.app/videos"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
            'ngrok-skip-browser-warning': "true"
          },
          body: jsonEncode({
            "name": video["name"],
            "desc": video["desc"],
            "url": video["url"],
          }),
        );

        if (videoResponse.statusCode == 200 ||
            videoResponse.statusCode == 201) {
          final videoData = jsonDecode(videoResponse.body);
          videoIds.add(videoData["id"]); // Salva o ID do vídeo criado
        } else {
          throw Exception("Erro ao criar vídeo: ${videoResponse.body}");
        }
      }

      // 2. Cria o curso e associa os vídeos
      Map<String, dynamic> courseData = {
        "title": _courseNameController.text,
        "desc": _courseDescriptionController.text,
        "videos": videoIds, // Relaciona os IDs dos vídeos ao curso
      };

      final courseResponse = await http.post(
        Uri.parse(
            "https://2ee4-2a09-bac5-633-1c96-00-2d9-1a.ngrok-free.app/courses"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          'ngrok-skip-browser-warning': "true"
        },
        body: jsonEncode(courseData),
      );

      if (courseResponse.statusCode == 200 ||
          courseResponse.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Curso enviado com sucesso!")),
        );
      } else {
        throw Exception("Erro ao enviar o curso: ${courseResponse.body}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: $e")),
      );
    }
  }

  void addVideo() {
    setState(() {
      videos.add({
        "name": _videoTitleController.text,
        "desc": _videoDescriptionController.text,
        "url": _videoUrlController.text,
      });
    });

    // Limpa os campos após adicionar o vídeo
    _videoTitleController.clear();
    _videoDescriptionController.clear();
    _videoUrlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Curso")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _courseNameController,
                decoration: InputDecoration(labelText: "Nome do Curso"),
              ),
              TextField(
                controller: _courseDescriptionController,
                decoration: InputDecoration(labelText: "Descrição do Curso"),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Text(
                "Vídeos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _videoTitleController,
                decoration: InputDecoration(labelText: "Título do Vídeo"),
              ),
              TextField(
                controller: _videoDescriptionController,
                decoration: InputDecoration(labelText: "Descrição do Vídeo"),
              ),
              TextField(
                controller: _videoUrlController,
                decoration: InputDecoration(labelText: "URL do Vídeo"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: addVideo,
                child: Text("Adicionar Vídeo"),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return ListTile(
                    title: Text(video["name"]!),
                    subtitle: Text(video["desc"]!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          videos.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: sendCourse,
                child: Text("Enviar Curso"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
