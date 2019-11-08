import 'package:flutter/material.dart';

class FormDesignBook extends StatefulWidget {
  final String proName;
  final String comName;
  final int itemId;
  final addFunc;
  final editFunc;

  FormDesignBook(
      {Key key,
      this.itemId,
      this.proName,
      this.comName,
      this.addFunc,
      this.editFunc})
      : super(key: key);

  @override
  _FormDesignBookState createState() => _FormDesignBookState();
}

class _FormDesignBookState extends State<FormDesignBook> {
  String _proName = "";
  String _comName = "";
  String _selectDeptName = "设计部";
  String _selectJob = "电气专业";

  TextEditingController _proNameController = TextEditingController();
  TextEditingController _comNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _proName = widget.proName ?? '';
    _comName = widget.comName ?? '';
    _proNameController.text = _proName;
    _comNameController.text = _comName;

    // print(widget.proName);
    // print(widget.comName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设计委托书信息：'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'save',
            onPressed: () {
              if (widget.proName == null || widget.proName.isEmpty) {
                widget.addFunc(_proName, _comName);
              } else {
                widget.editFunc(widget.itemId, _proName, _comName);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: _buildFormPage(),
    );
  }

  Widget _buildFormPage() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("接受委托部门："),
                    DropdownButton<String>(
                      hint: Text('下拉选择部门'),
                      value: _selectDeptName,
                      onChanged: (newValue) {
                        setState(() {
                          _selectDeptName = newValue;
                        });
                      },
                      items: <String>["设计部", "合同部", "生产部", "品质部"]
                          .map<DropdownMenuItem<String>>((v) {
                        return DropdownMenuItem<String>(
                            value: v, child: Text(v));
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("涉及主要专业"),
                    DropdownButton<String>(
                      hint: Text('下拉选择专业'),
                      value: _selectJob,
                      onChanged: (newValue) {
                        setState(() {
                          _selectJob = newValue;
                        });
                      },
                      items: <String>["电气专业", "设计专业", "工程专业", "电路专业"]
                          .map<DropdownMenuItem<String>>((v) {
                        return DropdownMenuItem<String>(
                            value: v, child: Text(v));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _proNameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5.0),
                        icon: Icon(Icons.create, color: Colors.red),
                        labelText: "项目名称：",
                      ),
                      onChanged: (newValue) {
                        _proName = newValue;
                      },
                      autofocus: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _comNameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5.0),
                        icon: Icon(Icons.create, color: Colors.red),
                        labelText: "项目单位：",
                      ),
                      onChanged: (newValue) {
                        _comName = newValue;
                      },
                      autofocus: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5.0),
                        icon: Icon(Icons.create),
                        labelText: "非必填项目：",
                      ),
                      onChanged: (newValue) {},
                      autofocus: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
