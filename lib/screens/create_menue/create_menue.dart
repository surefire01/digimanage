import 'package:digimanage/screens/create_menue/utils.dart';
import 'package:flutter/material.dart';

void showCreateMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text(
                "  Select action",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Container(
              height: 270,
              child: ListView.builder(
                //itemExtent: ,
                //restorationId: "Notification",
                itemCount: createMenueList.length,
                itemBuilder: (context, index) {
                  return CreateMenueTile(
                    title: createMenueList[index]["title"].toString(),
                    ic: createMenueList[index]["icon"] as IconData,
                    route: createMenueList[index]["route"] as Widget,
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1,color: Colors.grey[300]!))
              ),
                width: double.infinity,
                child: TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )))
          ],
        );
      });
}

class CreateMenueTile extends StatelessWidget {
  final IconData ic;
  final String title;
  final Widget route;

  const CreateMenueTile({required this.title, required this.ic,required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => route));},
          leading: Icon(ic),
          title: Text(title),
        ),
      ),
    );
  }
}
