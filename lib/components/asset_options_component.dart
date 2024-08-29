import 'package:flutter/material.dart';

class OptionsComponent extends StatelessWidget {
  String assetOption;
  String optionImage;
  String nextPage;

  OptionsComponent({
    super.key,
    required this.assetOption,
    required this.optionImage,
    required this.nextPage

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, nextPage),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFFE9E9E9),),
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(optionImage, width: 50, height: 50,),
                const SizedBox(width: 15),
                Text(assetOption, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF616260))),
              ],
            ),
            const ImageIcon(AssetImage('assets/icons/next-icon.png'), color: Color(0xFF183C70),)
          ],
        ),
      ),
    );
  }
}
