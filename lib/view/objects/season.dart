import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_network_application/entities/dto/entity_save_dto.dart';
import 'package:social_network_application/entities/mini_dto/season_mini.dart';
import 'package:social_network_application/scoped_model/season_model.dart';
import 'package:social_network_application/scoped_model/support/theme_model.dart';
import 'package:social_network_application/view/season/all_episodes_season.dart';
import 'package:social_network_application/view/season/new_episode_season.dart';
import 'package:social_network_application/view/season/update_review_season.dart';
import 'package:social_network_application/view/season/update_season.dart';
import 'package:social_network_application/widgets/mini_seasons/episode_mini_season.dart';
import 'package:social_network_application/widgets/mini_seasons/evaluation.dart';

// ignore: must_be_immutable
class Season extends StatefulWidget {
  SeasonMini seasonMini;
  Season({required this.seasonMini, Key? key}) : super(key: key);

  @override
  _SeasonState createState() => _SeasonState();
}

class _SeasonState extends State<Season> {
  @override
  void initState() {
    ScopedModel.of<SeasonModel>(context).seasonMiniIsNull = true;
    ScopedModel.of<SeasonModel>(context).dropdownList = [];
    ScopedModel.of<SeasonModel>(context).entitySaveMini = null;
    //ScopedModel.of<SeasonModel>(context).getId();
    ScopedModel.of<SeasonModel>(context).getId();
    ScopedModel.of<SeasonModel>(context)
        .getSeason(seasonId: widget.seasonMini.id);
    ScopedModel.of<SeasonModel>(context)
        .getEntitySave(seasonId: widget.seasonMini.id);
    // ScopedModel.of<SeasonModel>(context)
    //     .getWorkers(entityId: widget.entityMini.id);
    ScopedModel.of<SeasonModel>(context)
        .getEpisodes(seasonId: widget.seasonMini.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
      return ScopedModelDescendant<SeasonModel>(
          builder: (context, child, season) {
        return Scaffold(
            body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              !season.seasonMiniIsNull
                  ? ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        season.seasonMini.image != null
                            ? Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                height:
                                    (MediaQuery.of(context).size.width / 16) *
                                        9,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: theme.shadow,
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(season.seasonMini.image!),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              )
                            : Container(
                                color: theme.shadow,
                                height:
                                    (MediaQuery.of(context).size.width / 16) *
                                        9,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 100,
                                    color: theme.emphasis,
                                  ),
                                )),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          season.seasonMini.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 28,
                            color: theme.title,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          season.seasonMini.entity.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: theme.subtitle,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: theme.button,
                              elevation: 0.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateSeason(
                                            context: context,
                                            seasonMini: season.seasonMini,
                                          )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: theme.buttonMain,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  'edit season'.toLowerCase(),
                                  style: TextStyle(
                                    fontSize: 19,
                                    letterSpacing: 1.0,
                                    color: theme.buttonText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //update evaluation
                        season.entitySaveMini == null
                            ? Container()
                            : Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Evaluation(
                                        value: 1,
                                        evaluation: season.entitySaveMini !=
                                                null
                                            ? season.entitySaveMini!.evaluation!
                                            : 0),
                                    Evaluation(
                                        value: 2,
                                        evaluation: season.entitySaveMini !=
                                                null
                                            ? season.entitySaveMini!.evaluation!
                                            : 0),
                                    Evaluation(
                                        value: 3,
                                        evaluation: season.entitySaveMini !=
                                                null
                                            ? season.entitySaveMini!.evaluation!
                                            : 0),
                                    Evaluation(
                                        value: 4,
                                        evaluation: season.entitySaveMini !=
                                                null
                                            ? season.entitySaveMini!.evaluation!
                                            : 3),
                                    Evaluation(
                                        value: 5,
                                        evaluation: season.entitySaveMini !=
                                                null
                                            ? season.entitySaveMini!.evaluation!
                                            : 0),
                                  ],
                                ),
                              ),

                        //*update evaluation
                        season.entitySaveMini == null
                            ? Container()
                            : const SizedBox(
                                height: 16.0,
                              ),
                        //*update evaluation

                        Text(
                          season.seasonMini.evaluationAverage.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            letterSpacing: 2.0,
                            color: theme.emphasis,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          '( ' +
                              season.seasonMini.evaluationQuantity.toString() +
                              ' evaluations)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.0,
                            color: theme.subtitle,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),

                        //categoty update

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DropdownButton<int>(
                            hint: season.entitySaveMini == null
                                ? const Text('category')
                                : season.dropdownList[
                                    season.entitySaveMini!.category! - 1],
                            items: season.dropdownList,
                            onChanged: (value) {
                              // ignore: avoid_print
                              EntitySaveDTO entitySaveDTO = EntitySaveDTO(
                                idEntitySave: null,
                                idUser: season.idUser,
                                idEntity: null,
                                idSeason: season.seasonMini.id,
                                idEpisode: null,
                                category: value!,
                                goal: null,
                                rated: null,
                                reviewed: null,
                                evaluation: null,
                                review: null,
                                typeEntitySave: null,
                              );
                              if (season.entitySaveMini == null) {
                                season.newEntitySave(
                                    entitySaveDTO: entitySaveDTO,
                                    context: context);
                              } else {
                                if (value != season.entitySaveMini!.category!) {
                                  entitySaveDTO.idEntitySave =
                                      season.entitySaveMini!.id;
                                  season.updateCategoryEntitySave(
                                      entitySaveDTO: entitySaveDTO,
                                      context: context);
                                }
                              }
                            },
                          ),
                        ),

                        //*categoty update

                        const SizedBox(
                          height: 8.0,
                        ),
                        season.entitySaveMini == null
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //review update
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: theme.buttonMain,
                                      elevation: 1.0,
                                    ),
                                    onPressed: () {
                                      if (season.entitySaveMini != null &&
                                          season.entitySaveMini!.reviewed) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateReviewSeason(
                                                        review: season
                                                            .entitySaveMini!
                                                            .review!)));
                                      } else if (season.entitySaveMini !=
                                          null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateReviewSeason(
                                                        review: '')));
                                      }
                                    },
                                    child: season.entitySaveMini != null
                                        ? season.entitySaveMini!.reviewed
                                            ? Text(
                                                'update review',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 2.0,
                                                  color: theme.buttonMainText,
                                                ),
                                              )
                                            : Text(
                                                'add review',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 2.0,
                                                  color: theme.buttonMainText,
                                                ),
                                              )
                                        : Text(
                                            'add review',
                                            style: TextStyle(
                                              fontSize: 18,
                                              letterSpacing: 2.0,
                                              color: theme.buttonMainText,
                                            ),
                                          ),
                                  ),
                                  //*review update

                                  //goal update

                                  // IconButton(
                                  //   onPressed: () {
                                  //     if (season.entitySaveMini != null) {
                                  //       EntitySaveDTO entitySaveDTO = EntitySaveDTO(
                                  //         idEntitySave: entity.entitySaveMini!.id,
                                  //         idUser: entity.idUser,
                                  //         idEntity: entity.entityMini.id,
                                  //         idSeason: null,
                                  //         idEpisode: null,
                                  //         category: null,
                                  //         goal: !entity.entitySaveMini!.goal,
                                  //         rated: null,
                                  //         reviewed: null,
                                  //         evaluation: null,
                                  //         review: null,
                                  //         typeEntitySave: null,
                                  //       );
                                  //       entity.updateGoalEntitySave(
                                  //           entitySaveDTO: entitySaveDTO,
                                  //           context: context);
                                  //     }
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.add_task,
                                  //     color: season.entitySaveMini != null
                                  //         ? season.entitySaveMini!.goal
                                  //             ? Colors.purple
                                  //             : Colors.grey
                                  //         : Colors.grey,
                                  //    ),
                                  // ),

                                  //*goal update
                                ],
                              ),
                        const SizedBox(
                          height: 16.0,
                        ),

                        season.seasonMini.description != null
                            ? ExpansionTile(
                                tilePadding: const EdgeInsets.all(8.0),
                                onExpansionChanged: (_) {
                                  season.updateMaxLine();
                                },
                                title: Text(
                                  season.seasonMini.description!,
                                  maxLines: season.maxLine,
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.5,
                                    color: theme.subtitle,
                                  ),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'View all episodes',
                                  style: TextStyle(
                                      fontSize: 19, color: theme.title),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllEpisodesSeason(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: theme.title,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: season.episodes.length + 1,
                              itemBuilder: (context, index) {
                                if (index == season.episodes.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewEpisodeSeason(
                                                      seasonMini:
                                                          season.seasonMini,
                                                      context: context)),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: theme.shadow,
                                          border: Border.all(
                                            color: theme.shadow,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        width: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_box_outlined,
                                                color: theme.emphasis),
                                            Text(
                                              'add episode',
                                              style: TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1.5,
                                                color: theme.title,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return EpisodeMiniSeason(
                                      episodeMini: season.episodes[index]);
                                }
                              }),
                        ),

                        const SizedBox(
                          height: 16.0,
                        ),
                        // SizedBox(
                        //   height: 150,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: season.workers.length + 1,
                        //       itemBuilder: (context, index) {
                        //         if (index == season.workers.length) {
                        //           return Padding(
                        //             padding: const EdgeInsets.all(4.0),
                        //             child: GestureDetector(
                        //               onTap: () {
                        //                 // Navigator.push(
                        //                 //   context,
                        //                 //   MaterialPageRoute(
                        //                 //     builder: (context) => NewWorkerEntity(
                        //                 //         entityMini: entity.entityMini,
                        //                 //         context: context),
                        //                 //   ),
                        //                 // );
                        //               },
                        //               child: Container(
                        //                 decoration: BoxDecoration(
                        //                   border: Border.all(
                        //                       color: const Color(0xffce93d8)),
                        //                   borderRadius: BorderRadius.circular(8.0),
                        //                 ),
                        //                 width: 150,
                        //                 child: Center(
                        //                   child: Column(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.center,
                        //                     children: const [
                        //                       Icon(Icons.add_box_outlined),
                        //                       Text('add worker'),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           );
                        //         } else {
                        //           return Container();
                        //           return WorkerMiniEntity(
                        //             workerMini: entity.workers[index],
                        //             idUser: entity.idUser,
                        //           );
                        //         }
                        //       }),
                        // ),
                        // const SizedBox(
                        //   height: 16.0,
                        // )
                      ],
                    )
                  : Container(),
              season.load
                  ? Positioned(
                      bottom: 0.1,
                      child: SizedBox(
                        height: 5.0,
                        width: MediaQuery.of(context).size.width,
                        child: const LinearProgressIndicator(),
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
      });
    });
  }
}
