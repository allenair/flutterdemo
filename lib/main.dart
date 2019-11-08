import 'package:flutter/material.dart';
import 'components/ListCard.dart';
import 'components/FormDesignBook.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: '设计委托书列表'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedBarIndex = 0;
  List _proList = [
    {
      'proName': 'a',
      'comName': '中新软件aaa',
      'finDate': '2019年11月11日',
      'statusName': '准备'
    }
  ];

  void _deleteItem(int index) {
    setState(() {
      _proList.removeAt(index);
    });
  }

  void _addItem(String proName, String comName) {
    setState(() {
      _proList.add({
        'proName': proName ?? '测试项目',
        'comName': comName ?? '中新软件',
        'finDate': '2019年11月11日',
        'statusName': '准备'
      });
    });
  }

  void _editItem(int index, String proName, String comName) {
    setState(() {
      _proList[index] = {
        'proName': proName,
        'comName': comName,
        'finDate': _proList[index]['finDate'],
        'statusName': _proList[index]['statusName']
      };
    });
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/home_list.json').then((value) {
      var listContent = json.decode(value);
      setState(() {
        _proList = listContent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + '（$_selectedBarIndex）'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: '新增委托书',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FormDesignBook(
                      itemId: 0,
                      proName: '',
                      comName: '',
                      addFunc: (proName, comName) => _addItem(proName, comName),
                      editFunc: (i, proName, comName) =>
                          _editItem(i, proName, comName),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: _buildProjects(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('主页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('任务'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的'),
            ),
          ],
          currentIndex: _selectedBarIndex,
          selectedItemColor: Colors.redAccent,
          onTap: (index) {
            setState(() {
              _selectedBarIndex = index;
            });
          }),
    );
  }

  Widget _buildProjects() {
    return new ListView.builder(
      itemCount: _proList.length,
      itemBuilder: (context, index) {
        Map item = _proList[index];
        return ListViewItem(
          itemId: index,
          proName: item['proName'],
          comName: item['comName'],
          finDate: item['finDate'],
          statusName: item['statusName'],
          deleteFunc: (i) => _deleteItem(i),
          addFunc: (proName, comName) => _addItem(proName, comName),
          editFunc: (i, proName, comName) => _editItem(i, proName, comName),
        );
      },
    );
  }
}
