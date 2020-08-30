import 'package:flutter/material.dart';
import 'dart:math';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          children: [
            Container(
              height: constraints.maxHeight,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(4),
                children: List.generate(15, (index) {
                  return Card(
                    child: Text(
                      'Category $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    elevation: 2,
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
