import 'package:Consult/service/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  String? token;
  int? id;

  String? urlEnv = dotenv.env["BASEURL"];

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");
    var strId = await LocalAuthService().getId("id");

    if (mounted) {
      setState(() {
        token = strToken;
        id = int.parse(strId!);
      });
    }
  }

  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseDescriptionController =
      TextEditingController();

  List<Map<String, String>> videos = [];
  final TextEditingController _videoTitleController = TextEditingController();
  final TextEditingController _videoDescriptionController =
      TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();
  final TextEditingController _urlbannerController = TextEditingController();

  Future<void> sendCourse() async {
    print(token.toString());
    print(id);
    try {
      // 1. Cria os vídeos e salva os IDs gerados
      List<int> videoIds = [];
      for (var video in videos) {
        final videoResponse = await http.post(
          Uri.parse("$urlEnv/videos"),
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
        "enterprise": id,
        "urlbanner": _urlbannerController.text,
        "videos": videoIds, // Relaciona os IDs dos vídeos ao curso
      };

      final courseResponse = await http.post(
        Uri.parse("$urlEnv/courses"),
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
               TextField(
                controller: _urlbannerController,
                decoration: InputDecoration(labelText: "URL de imagem do Curso"),
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
