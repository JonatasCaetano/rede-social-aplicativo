import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_network_application/entities/dto/entity_save_dto.dart';
import 'package:social_network_application/scoped_model/entity_model.dart';
import 'package:social_network_application/scoped_model/support/theme_model.dart';

// ignore: must_be_immutable
class UpdateReviewEntity extends StatefulWidget {
  String review;
  UpdateReviewEntity({required this.review, Key? key}) : super(key: key);

  @override
  _UpdateReviewEntityState createState() => _UpdateReviewEntityState();
}

class _UpdateReviewEntityState extends State<UpdateReviewEntity> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.review;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
      return ScopedModelDescendant<EntityModel>(
          builder: (context, child, entity) {
        return Form(
          key: _globalKey,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Review",
                style: TextStyle(
                  color: theme.title,
                  fontSize: 24.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 30.0),
                  child: ListView(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'your review cannot be empty';
                          }
                        },
                        controller: controller,
                        minLines: 10,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          label: Text("review"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme.buttonMain,
                          elevation: 0.0,
                        ),
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            EntitySaveDTO entitySaveDTO = EntitySaveDTO(
                              idEntitySave: entity.entitySaveMini!.id,
                              idUser: null,
                              idEntity: null,
                              idSeason: null,
                              idEpisode: null,
                              category: null,
                              goal: null,
                              rated: null,
                              reviewed: true,
                              evaluation: null,
                              review: controller.text,
                              level: null,
                            );
                            entity.updateReviewEntitySave(
                                entitySaveDTO: entitySaveDTO, context: context);
                          }
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.0,
                            color: theme.buttonMainText,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                entity.load
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
          ),
        );
      });
    });
  }
}
