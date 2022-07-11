import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {

  final String coffeImagePath;
  final String coffeeName;
  final String coffePrice;

  CoffeeTile({
    required this.coffeImagePath,
    required this.coffeeName,
    required this.coffePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // coffee image
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeImagePath)
            ),
            // coffee name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('With Almond Milk',
                    style: TextStyle(
                        color: Colors.grey[700]
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('\$'+coffePrice),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Icon(Icons.add)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
