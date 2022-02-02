import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_network_application/converts/convert_date.dart';
import 'package:social_network_application/converts/convert_to_enum.dart';
import 'package:social_network_application/entities/mini_dto/post_update_mini.dart';
import 'package:social_network_application/scoped_model/post_model.dart';
import 'package:social_network_application/scoped_model/profile_model.dart';
import 'package:social_network_application/scoped_model/support/language_model.dart';
import 'package:social_network_application/scoped_model/support/theme_model.dart';
import 'package:social_network_application/scoped_model/user_model.dart';
import 'package:social_network_application/view/objects/entity.dart';
import 'package:social_network_application/view/objects/user.dart';
import 'package:social_network_application/view/post/comments_post_update.dart';

// ignore: must_be_immutable
class UpdatePostEntityWidget extends StatefulWidget {
  PostUpdateMini postUpdateMini;
  bool screenComment;
  bool screenUser;
  UpdatePostEntityWidget(
      {required this.postUpdateMini,
      required this.screenComment,
      required this.screenUser,
      Key? key})
      : super(key: key);

  @override
  _UpdatePostEntityWidgetState createState() => _UpdatePostEntityWidgetState();
}

class _UpdatePostEntityWidgetState extends State<UpdatePostEntityWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
      return ScopedModel<PostModel>(
        model: PostModel(
          context: context,
          idPost: widget.postUpdateMini.id!,
          likes: widget.postUpdateMini.likeQuantity,
          comments: widget.postUpdateMini.commentQuantity,
        ),
        child:
            ScopedModelDescendant<PostModel>(builder: (context, child, post) {
          return Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.postUpdateMini.user!.image != null
                      ? GestureDetector(
                          onTap: () {
                            if (widget.postUpdateMini.user!.id !=
                                ScopedModel.of<ProfileModel>(context)
                                    .userMini
                                    .id) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User(
                                        userMini: widget.postUpdateMini.user!)),
                              );
                            }
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                widget.postUpdateMini.user!.image!),
                            radius: 30.0,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (widget.postUpdateMini.user!.id !=
                                ScopedModel.of<ProfileModel>(context)
                                    .userMini
                                    .id) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User(
                                        userMini: widget.postUpdateMini.user!)),
                              );
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: theme.shadow,
                            child: Icon(
                              Icons.image,
                              color: theme.emphasis,
                            ),
                            radius: 30.0,
                          ),
                        ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90.0,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.postUpdateMini.user!.id !=
                                ScopedModel.of<ProfileModel>(context)
                                    .userMini
                                    .id) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User(
                                        userMini: widget.postUpdateMini.user!)),
                              );
                            }
                          },
                          child: Text(
                            widget.postUpdateMini.user!.name,
                            // +
                            // " " +
                            // LanguageModel().entitiesCategories[
                            //         ConvertToEnum.convertTypeEntityToValue(
                            //             typeEntity: widget.postUpdateMini
                            //                 .entity!.typeEntity)]
                            //     [widget.postUpdateMini.category] +
                            // " " +
                            // widget.postUpdateMini.entity!.name,
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.0,
                              color: theme.title,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(" "),
                        Text(
                          LanguageModel().entitiesCategoriesPost[
                                  ConvertToEnum.convertTypeEntityToValue(
                                      typeEntity: widget
                                          .postUpdateMini.entity!.typeEntity)]
                              [widget.postUpdateMini.category],
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.0,
                            color: theme.title,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(" "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Entity(
                                        entityMini:
                                            widget.postUpdateMini.entity!,
                                        datasheetIsOpen: false)));
                          },
                          child: Text(
                            widget.postUpdateMini.entity!.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.0,
                              color: theme.title,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Text(
                        //   " • ",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     letterSpacing: 1.0,
                        //     color: theme.subtitle,
                        //     fontWeight: FontWeight.normal,
                        //   ),
                        // ),
                        Text(
                          " • " +
                              ConvertDate.convertToDatePost(
                                  release: widget.postUpdateMini.release!),
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.0,
                            color: theme.subtitle,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              widget.postUpdateMini.category != 6
                  ? Container()
                  : Container(
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            size: 50,
                            color: widget.postUpdateMini.evaluation >= 1
                                ? Colors.yellow[700]
                                : theme.icon,
                          ),
                          Icon(
                            Icons.star,
                            size: 50,
                            color: widget.postUpdateMini.evaluation >= 2
                                ? Colors.yellow[700]
                                : theme.icon,
                          ),
                          Icon(
                            Icons.star,
                            size: 50,
                            color: widget.postUpdateMini.evaluation >= 3
                                ? Colors.yellow[700]
                                : theme.icon,
                          ),
                          Icon(
                            Icons.star,
                            size: 50,
                            color: widget.postUpdateMini.evaluation >= 4
                                ? Colors.yellow[700]
                                : theme.icon,
                          ),
                          Icon(
                            Icons.star,
                            size: 50,
                            color: widget.postUpdateMini.evaluation >= 5
                                ? Colors.yellow[700]
                                : theme.icon,
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 8.0,
              ),
              !widget.postUpdateMini.spoiler
                  ? widget.postUpdateMini.body != null
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.postUpdateMini.body!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1.0,
                                color: theme.title,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      : Container()
                  : ExpansionTile(
                      tilePadding: const EdgeInsets.all(8.0),
                      title: Text(
                        'Spoiler',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 1.0,
                          color: theme.title,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.postUpdateMini.body!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.0,
                                color: theme.title,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 8.0,
              ),
              widget.postUpdateMini.entity!.image != null
                  ? GestureDetector(
                      onTap: () {
                        if (!widget.screenComment) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsPostUpdate(
                                postUpdateMini: widget.postUpdateMini,
                                screenUser: widget.screenUser,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: (MediaQuery.of(context).size.width / 16) * 9,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: theme.shadow,
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.postUpdateMini.entity!.image!),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        if (!widget.screenComment) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsPostUpdate(
                                postUpdateMini: widget.postUpdateMini,
                                screenUser: widget.screenUser,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        color: theme.shadow,
                        height: (MediaQuery.of(context).size.width / 16) * 9,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 100,
                            color: theme.emphasis,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (!widget.screenComment && !widget.screenUser) {
                          ScopedModel.of<ProfileModel>(context).updateLikePost(
                              context: context,
                              idPost: widget.postUpdateMini.id!);
                        } else if (widget.screenUser && !widget.screenComment) {
                          ScopedModel.of<UserModel>(context).updateLikePost(
                              context: context,
                              idPost: widget.postUpdateMini.id!);
                        } else {
                          post.updateLikePost(
                            context: context,
                            idPost: widget.postUpdateMini.id!,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.button,
                          border: Border.all(
                            color: theme.button,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.thumb_up_alt_outlined),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  !widget.screenComment
                                      ? widget.postUpdateMini.likeQuantity
                                          .toString()
                                      : post.likeQuantity.toString(),

                                  // widget.screenComment
                                  //     ? post.likeQuantity == 0
                                  //         ? widget.postUpdateMini.likeQuantity
                                  //             .toString()
                                  //         : post.likeQuantity.toString()
                                  //     : widget.postUpdateMini.likeQuantity
                                  //         .toString(),
                                  style: TextStyle(
                                    fontSize: 21,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (!widget.screenComment) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsPostUpdate(
                                postUpdateMini: widget.postUpdateMini,
                                screenUser: widget.screenUser,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.button,
                          border: Border.all(
                            color: theme.button,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.messenger_outline),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  !widget.screenComment
                                      ? widget.postUpdateMini.commentQuantity
                                          .toString()
                                      : post.commentQuantity.toString(),

                                  // widget.screenComment
                                  //     ? post.commentQuantity == 0
                                  //         ? widget
                                  //             .postUpdateMini.commentQuantity
                                  //             .toString()
                                  //         : post.commentQuantity.toString()
                                  //     : widget.postUpdateMini.commentQuantity
                                  //         .toString(),
                                  style: TextStyle(
                                    fontSize: 21,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          );
        }),
      );
    });
  }
}
