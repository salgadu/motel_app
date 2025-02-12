import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';

class ViewMoreCategories extends StatelessWidget {
  final String suiteName;
  final List<CategoriaItem> categoriaItem;
  final List<Item> items;

  const ViewMoreCategories({
    super.key,
    required this.suiteName,
    required this.categoriaItem,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                suiteName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            _customText('Pricipais itens'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: categoriaItem
                  .map(
                    (e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: e.icone,
                          width: Dimensions.overLargeIconSize,
                          height: Dimensions.overLargeIconSize,
                        ),
                        const SizedBox(width: 8),
                        Text(e.nome),
                      ],
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            _customText('Tem também'),
            const SizedBox(height: 8),
            Text(
              items.map((e) => e.nome).join(', '),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  _customText(String text) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.black87, thickness: 0.5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const Expanded(child: Divider(color: Colors.black87, thickness: 0.5)),
      ],
    );
  }
}
