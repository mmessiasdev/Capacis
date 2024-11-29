import 'package:Consult/component/colors.dart';
import 'package:Consult/component/containersLoading.dart';
import 'package:Consult/component/contentproduct.dart';
import 'package:Consult/component/texts.dart';
import 'package:Consult/model/stores.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:Consult/component/colors.dart';
import 'package:Consult/component/containersLoading.dart';
import 'package:Consult/component/contentproduct.dart';
import 'package:Consult/model/stores.dart';
import 'package:Consult/service/local/auth.dart';
import 'package:Consult/service/remote/auth.dart';
import 'package:flutter/material.dart';

class RenderContents extends StatefulWidget {
  RenderContents({super.key, required this.query});

  String query;

  @override
  State<RenderContents> createState() => _RenderContentsState();
}

class _RenderContentsState extends State<RenderContents> {
  String? token;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");
    setState(() {
      token = strToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: token == null
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: PrimaryColor,
            ))
          : FutureBuilder<List<StoresModel>>(
              future: RemoteAuthService()
                  .getOnlineStoresSearch(token: token!, query: widget.query),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        childAspectRatio: 0.65, // Proporção padrão
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var render = snapshot.data![index];
                        return GestureDetector(
                          child: ContentProduct(
                              urlLogo: render.logourl.toString(),
                              maxl: 1,
                              over: TextOverflow.fade,
                              drules:
                                  "${render.percentcashback.toString()}% de cashback",
                              title: render.name.toString(),
                              id: render.id.toString()),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => StoreScreen(
                          //         id: render.id.toString(),
                          //       ),
                          //     ),
                          //   );
                          // },
                        );
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.hasError);
                  return const SizedBox(
                      height: 280,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: WidgetLoading(),
                      ));
                }
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: PrimaryColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class SearchDelegateScreen extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Pesquise produtos ou lojas';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Define as ações para a barra de pesquisa (ex: limpar o texto)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ""; // Limpa a query de busca
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Define o ícone principal à esquerda da barra de pesquisa (ex: voltar)
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, ""); // Fecha a pesquisa
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Scaffold();
    }
    return RenderContents(
      query: query,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Scaffold();
    }
    return RenderContents(
      query: query,
    );
  }
}
