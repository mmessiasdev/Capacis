import 'package:Consult/component/colors.dart';
import 'package:Consult/view/search/searchdelscreen.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: PrimaryColor,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  size: 25,
                )),
          ),
        ),
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchDelegateScreen(), // Chamando o SearchDelegate
          );
        },
      ),
    );
  }
}
