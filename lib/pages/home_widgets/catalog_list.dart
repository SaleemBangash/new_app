import 'package:flutter/material.dart';
import 'package:new_app/models/catalog.dart';
import 'package:new_app/pages/home.dart';
import 'package:new_app/pages/home_detail.dart';
import 'package:new_app/pages/home_widgets/catalog_item.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => home_detail(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}
