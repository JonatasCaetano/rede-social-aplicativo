// import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:social_network_application/entities/dto/entity_save_dto.dart';
// import 'package:social_network_application/scoped_model/season_model.dart';
// import 'package:social_network_application/scoped_model/support/theme_model.dart';

// // ignore: must_be_immutable
// class Evaluation extends StatefulWidget {
//   int value, evaluation;
//   Evaluation({required this.value, required this.evaluation, Key? key}) : super(key: key);

//   @override
//   _EvaluationState createState() => _EvaluationState();
// }

// class _EvaluationState extends State<Evaluation> {
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
//       return ScopedModelDescendant<SeasonModel>(builder: (context, child, season) {
//         return IconButton(
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               if (widget.evaluation != widget.value && season.entitySaveMini != null) {
//                 EntitySaveDTO entitySaveDTO = EntitySaveDTO(
//                   idEntitySave: season.entitySaveMini!.id,
//                   idUser: null,
//                   idEntity: null,
//                   idSeason: null,
//                   idEpisode: null,
//                   category: null,
//                   goal: null,
//                   rated: null,
//                   reviewed: null,
//                   evaluation: widget.value,
//                   review: null,
//                   level: null,
//                   spoiler: false,
//                   release: null,
//                 );
//                 season.updateEvaluationEntitySave(entitySaveDTO: entitySaveDTO, context: context);
//               }
//             },
//             icon: Icon(
//               Icons.star,
//               size: 40,
//               color: widget.evaluation >= widget.value ? Colors.yellow[700] : theme.icon,
//             ));
//       });
//     });
//   }
// }
