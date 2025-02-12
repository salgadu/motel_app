import 'package:flutter/material.dart';
import 'package:motel_list/app/core/components/custom_container.dart';
import 'package:motel_list/app/core/utils/utils.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';

class CardPrice extends StatelessWidget {
  final String time;
  final double price;
  final Desconto? desconto;

  const CardPrice(
      {super.key,
      required this.time,
      required this.price,
      required this.desconto});

  @override
  Widget build(BuildContext context) {
    double discountPercentage = 0;
    if (desconto != null && desconto!.desconto > 0) {
      discountPercentage = (desconto!.desconto / price) * 100;
    }

    return CustomContainer(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (discountPercentage > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '-${discountPercentage.toStringAsFixed(0)}% off',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Text(
                    Utils.formatPrice(price),
                    style: TextStyle(
                      color: Colors.black54,
                      decoration: desconto != null
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  SizedBox(width: 8),
                  if (desconto != null)
                    Text(
                      Utils.formatPrice(desconto!.desconto),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const Icon(Icons.chevron_right, color: Colors.black),
        ],
      ),
    );
  }
}
