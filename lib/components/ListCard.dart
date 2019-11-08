import 'package:flutter/material.dart';
import './AllNodeList.dart';

class ListViewItem extends StatelessWidget {
  final int itemId;
  final String proName;
  final String comName;
  final String finDate;
  final String statusName;
  final deleteFunc;
  final addFunc;
  final editFunc;

  const ListViewItem(
      {Key key,
      this.itemId,
      this.proName,
      this.comName,
      this.finDate,
      this.statusName,
      this.deleteFunc,
      this.addFunc,
      this.editFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AllNodeList(
                    itemId: itemId,
                    proName: proName,
                    comName: comName,
                    addFunc: addFunc,
                    editFunc: editFunc);
              },
            ),
          );
        },
        onLongPress: () {
          _showMyMenu(context);
        },
        title: Padding(
          child: Text(
            proName,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 7.0),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comName,
                style: TextStyle(color: Colors.black54, fontSize: 12.0)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(finDate,
                      style: TextStyle(color: Colors.black54, fontSize: 12.0)),
                  Text(statusName,
                      style:
                          TextStyle(color: Colors.lightBlue, fontSize: 12.0)),
                ],
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.more_vert, color: Colors.grey, size: 30.0),
        isThreeLine: true,
      ),
    );
  }

  void _showMyMenu(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("操作"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("删除"),
                onPressed: () {
                  deleteFunc(itemId);
                  Navigator.of(context).pop();
                },
              ),
              SimpleDialogOption(
                child: Text("Test"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
