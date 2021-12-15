import 'package:flutter/material.dart';
import 'package:newtestmvc/src/models/cats_model.dart';

class PageAWidget extends StatelessWidget {
  const PageAWidget({
    Key? key,
    required this.listCats,
  }) : super(key: key);

  // declare variable
  final List<CatsAssets> listCats;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical, 
        itemCount: listCats.length, 
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                color: Colors.amber,
                elevation: 3, //shadow
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          '${listCats[index].title} : ${listCats[index].subtitle}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
