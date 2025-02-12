import 'package:flutter/material.dart';
import 'package:motel_list/app/core/components/custom_container.dart';
import 'package:motel_list/app/core/components/custom_icon.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';
import 'package:motel_list/app/motel/ui/suite_gallery.dart';
import 'package:motel_list/app/motel/ui/view_more_categories.dart';
import 'package:motel_list/app/motel/ui/widgets/card_hotel_components/card_price.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardSuites extends StatelessWidget {
  final Suite suite;
  const CardSuites({
    super.key,
    required this.suite,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height * 0.01;
    final spacing = SizedBox(height: mediaQuery);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: (MediaQuery.of(context).size.width * 0.93),
            maxHeight: (MediaQuery.of(context).size.height * 0.4),
          ),
          padding: EdgeInsets.all(Dimensions.smallPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuiteGallery(
                            fotos: suite.fotos, suiteName: suite.nome),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: suite.fotos[0],
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              spacing,
              Text(suite.nome, style: TextStyle(fontWeight: FontWeight.bold)),
              spacing,
              if (suite.qtd <= 3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: Dimensions.extraSmallIconSize,
                    ),
                    SizedBox(width: Dimensions.smallPadding),
                    Text(
                      'Só mais ${suite.qtd} pelo app',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
            ],
          ),
        ),
        spacing,
        CustomContainer(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: suite.categoriaItens
                    .take(4)
                    .map(
                      (e) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [CustomIcon(icon: e.icone)],
                      ),
                    )
                    .toList(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewMoreCategories(
                          suiteName: suite.nome,
                          categoriaItem: suite.categoriaItens,
                          items: suite.itens),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text('Ver\ntodos', textAlign: TextAlign.right),
                    const SizedBox(width: Dimensions.labelPadding),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: suite.periodos.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spacing,
                CardPrice(
                  time: e.tempoFormatado,
                  price: e.valorTotal,
                  desconto: e.desconto,
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
