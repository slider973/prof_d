import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/card_prof_d_container.dart';
import 'package:sizer/sizer.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  final UserProfd user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum CivilityCharacter { mrs, mr }

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: SvgPicture.asset('assets/image/home_page_image.svg'),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.3.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Bonjour ${widget.user.firstname}',
                          style: Theme.of(context).textTheme.headline5),
                    )
                  ],
                ),
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
          Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 9.0, top: 8.0),
              child: Text(
                'Voici la liste de reservation selectionner une ci desous',
                style: TextStyle(
                  fontSize: 10.2.sp,
                ),
              ),
            ),
          ),
           Expanded(
            child: CardProfDContainer(),
          ),
        ],
      ),
    );
  }
}


