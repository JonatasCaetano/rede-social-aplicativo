import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:social_network_application/scoped_model/menu_model.dart';
import 'package:social_network_application/scoped_model/profile_model.dart';
import 'package:social_network_application/scoped_model/support/language_model.dart';
import 'package:social_network_application/scoped_model/support/theme_model.dart';
import 'package:social_network_application/view/tabs/profile.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(builder: (context, child, theme) {
      return ScopedModel<MenuModel>(
          model: MenuModel(context: context),
          child:
              ScopedModelDescendant<MenuModel>(builder: (context, child, menu) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: Text(
                  'Menu',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                            child: Column(
                              children: [
                                Divider(
                                  color: theme.button,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_rounded,
                                      size: 24,
                                      color: theme.emphasis,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          !ScopedModel.of<ProfileModel>(context)
                                                  .profileNull
                                              ? Text(
                                                  // ignore: unnecessary_null_comparison
                                                  ScopedModel.of<ProfileModel>(
                                                          context)
                                                      .userMini
                                                      .name,
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    letterSpacing: 1.0,
                                                    color: theme.title,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )
                                              : Text(
                                                  'Profile',
                                                  style: TextStyle(
                                                    fontSize: 19,
                                                    letterSpacing: 1.0,
                                                    color: theme.title,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                          const SizedBox(
                                            height: 2.0,
                                          ),
                                          Text(
                                            "view your profile",
                                            style: TextStyle(
                                              fontSize: 16,
                                              letterSpacing: 1.0,
                                              color: theme.subtitle,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Divider(
                                  color: theme.button,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                        ),

                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.drafts,
                                  size: 24,
                                  color: theme.emphasis,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    "Invitation",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                      color: theme.title,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  menu.invitation,
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        // GestureDetector(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(12.0),
                        //     child: Row(
                        //       children: const [
                        //         Icon(
                        //           Icons.groups,
                        //           size: 18,
                        //           color: Colors.purple,
                        //         ),
                        //         SizedBox(
                        //           width: 8,
                        //         ),
                        //         Text(
                        //           "Groups",
                        //           style: TextStyle(fontSize: 18),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   onTap: () {},
                        // ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 24,
                                  color: theme.emphasis,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    "Language",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                      color: theme.title,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Text(
                                  LanguageModel().language,
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.dark_mode,
                                size: 24,
                                color: theme.emphasis,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "Dark mode",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Switch.adaptive(
                                    value: menu.isDark,
                                    onChanged: (value) {
                                      menu.saveDarkMode(
                                          dark: value, context: context);
                                    }),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  size: 24,
                                  color: theme.emphasis,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Register new",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            if (ScopedModel.of<ProfileModel>(context)
                                .userMini
                                .checked) {
                              menu.showListEntitiesBottomSheet(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'only released to verified users')),
                              );
                            }
                          },
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 24,
                                  color: theme.emphasis,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Exit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                    color: theme.title,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            menu.logOut(context: context);
                          },
                        ),
                      ],
                    ),
                  ),
                  menu.load
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
            );
          }));
    });
  }
}
