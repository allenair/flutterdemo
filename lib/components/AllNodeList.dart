import 'package:flutter/material.dart';
import './FormDesignBook.dart';

class AllNodeList extends StatelessWidget {
  final List _allItemName = [
    {"id": "code01", "name": "设计委托书信息", "icon": Icons.assignment},
    {"id": "code02", "name": "设计人员配置表", "icon": Icons.assignment_ind},
    {"id": "code03", "name": "基础资料清单", "icon": Icons.reorder},
    {"id": "code04", "name": "原始资料清单", "icon": Icons.view_list},
    {"id": "code05", "name": "调查收资表", "icon": Icons.attach_money},
    {"id": "code06", "name": "技术原则清单", "icon": Icons.insert_chart},
    {"id": "code07", "name": "设计和开发计划", "icon": Icons.insert_invitation},
    {"id": "code08", "name": "会议", "icon": Icons.group},
    {"id": "code09", "name": "选型参数表", "icon": Icons.event_available},
    {"id": "code10", "name": "设计和开发输出单", "icon": Icons.event_note},
    {"id": "code11", "name": "技术协议", "icon": Icons.cast},
    {"id": "code12", "name": "选型参数表（设计）", "icon": Icons.table_chart},
    {"id": "code13", "name": "设计文件会签单", "icon": Icons.edit},
    {"id": "code14", "name": "设计遗留问题跟踪", "icon": Icons.grid_on},
    {"id": "code15", "name": "设计变更单", "icon": Icons.gradient},
    {"id": "code16", "name": "质量鉴定记录", "icon": Icons.healing},
    {"id": "code17", "name": "顾客满意度调查表", "icon": Icons.favorite}
  ];

  final String proName;
  final String comName;
  final int itemId;
  final addFunc;
  final editFunc;

  AllNodeList(
      {Key key,
      this.itemId,
      this.proName,
      this.comName,
      this.addFunc,
      this.editFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('操作列表'),
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: _allItemName.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1.0, color: Colors.blue),
        itemBuilder: (BuildContext context, int index) {
          Map itemMap = _allItemName[index];
          return ListTile(
            title: Text(itemMap["name"]),
            leading: Icon(itemMap["icon"], color: Colors.blueAccent),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: false,
            dense: true,
            contentPadding: EdgeInsets.all(10.0),
            enabled: true,
            onTap: () {
              // print("click ${itemMap['name']} -- ${itemMap['id']}");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FormDesignBook(
                        itemId: itemId,
                        proName: proName,
                        comName: comName,
                        addFunc: addFunc,
                        editFunc: editFunc);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
