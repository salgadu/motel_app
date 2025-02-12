import 'package:flutter/material.dart';

class SuiteGallery extends StatelessWidget {
  final String suiteName;
  final List<String> fotos;
  const SuiteGallery({super.key, required this.fotos, required this.suiteName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(suiteName,
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      body: ListView.builder(
        itemCount: (fotos.length / 2).ceil(),
        itemBuilder: (context, index) {
          if (index == 0) {
            // First photo takes the full width
            return Card(
              child: Image.network(
                fotos[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          } else {
            // Subsequent photos are displayed in pairs
            int firstPhotoIndex = index * 2 - 1;
            int secondPhotoIndex = firstPhotoIndex + 1;
            return Row(
              children: [
                Expanded(
                  child: Card(
                    child: Image.network(
                      fotos[firstPhotoIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (secondPhotoIndex < fotos.length)
                  Expanded(
                    child: Card(
                      child: Image.network(
                        fotos[secondPhotoIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
