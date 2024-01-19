import 'package:complaint_management/constants.dart';
import 'package:flutter/material.dart';

class RightCard extends StatelessWidget {
  final String title;
  final String img;
  final String description;

  const RightCard({
    super.key,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color4,
        ),
    
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
    
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.zero),
                color: color2,
              ),
              
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Image.asset('assets/$img',width: 100,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Text(
                      description,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}