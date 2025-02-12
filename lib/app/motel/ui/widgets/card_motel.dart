import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:motel_list/app/core/constants/dimensions.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';
import 'package:motel_list/app/motel/ui/widgets/card_hotel_components/card_suites.dart';

class CardHotel extends StatelessWidget {
  final Motel motel;
  const CardHotel({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: Dimensions.smallPadding);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.smallPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(motel.logo)),
              const SizedBox(width: Dimensions.defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(motel.fantasia,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(motel.bairro, style: TextStyle(color: Colors.grey)),
                  spacing,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: Dimensions.labelPadding,
                            horizontal: Dimensions.extraSmallPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: Dimensions.extraSmallIconSize,
                            ),
                            const SizedBox(width: Dimensions.extraSmallPadding),
                            Text(
                              motel.media.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Dimensions.smallPadding),
                      Row(
                        children: [
                          Text(
                            '${motel.qtdAvaliacoes} avaliações',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(width: Dimensions.extraSmallPadding),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                            size: Dimensions.extraSmallIconSize,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.favorite,
                  color: Colors.grey[500],
                  size: Dimensions.largeIconSize,
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.smallPadding),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: motel.suites
                .map((suite) => Padding(
                      padding:
                          const EdgeInsets.only(right: Dimensions.smallPadding),
                      child: CardSuites(suite: suite),
                    ))
                .toList(),
          ),
        ),

        // CardSuites(
        //   motel: motel,
        // ),
      ],
    );
  }
}
