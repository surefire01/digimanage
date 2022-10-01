import 'package:digimanage/utils/utils.dart';
import 'package:flutter/material.dart';


class ClubScreen extends StatelessWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,40,20,20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: avatarSize,
            backgroundImage: NetworkImage(clubProPicUrl),
          ),
          const SizedBox(height: 20,),
          Text("Team Vatsalya",style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),)

        ],
      ),
    );

  }
}
