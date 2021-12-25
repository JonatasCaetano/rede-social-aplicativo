import 'package:flutter/material.dart';
import 'package:social_network_application/entities/mini_dto/season_mini.dart';
import 'package:social_network_application/scoped_model/language_model.dart';
import 'package:social_network_application/view/objects/season.dart';

// ignore: must_be_immutable
class SeasonMiniResult extends StatefulWidget {
  SeasonMini seasonMini;
  SeasonMiniResult({required this.seasonMini, Key? key}) : super(key: key);

  @override
  _SeasonMiniResultState createState() => _SeasonMiniResultState();
}

class _SeasonMiniResultState extends State<SeasonMiniResult> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Season(seasonMini: widget.seasonMini)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            widget.seasonMini.image != null
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.seasonMini.image.toString()),
                    radius: 30.0,
                  )
                : CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.person),
                    radius: 30.0,
                  ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.seasonMini.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  LanguageModel().typeObject[2],
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
