import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart' as model;
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/global_variables.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = "";

    int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    }
    @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap.data());

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    void navigationTapped(int page){
        pageController.jumpToPage(page);
    }

    void onPageChanged(int page){
      setState(() {
        _page = page;
      });
    }

    model.User _user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics:const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
         children: homeScreenItems,
      ),
      bottomNavigationBar:
          CupertinoTabBar(
            onTap: navigationTapped,
            backgroundColor: mobileBackgroundColor, items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _page == 0 ? primaryColor : secondaryColor,
          ),
          label: '',
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search,
            color: _page == 1 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,
            color: _page == 2 ? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,
          ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
            color: _page == 3 ? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.person,
            color: _page == 4 ? primaryColor : secondaryColor,), label: '', backgroundColor: primaryColor),
      ]),
     
    );
  }
}
