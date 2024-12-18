import 'package:flutter/material.dart';

void main(){

  runApp( NavExample());
}





class NavExample
    extends StatelessWidget {
  const NavExample
      ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage
    extends StatefulWidget {
  const HomePage
      ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _content = 'Home Page';
  List<String> itemList = ['iphone 15', 'Nothing 24', 'Pixel 8 Pro'];

  void _updateContent(String newContent) {
    setState(() {
      _content = newContent;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Drawer Example'),),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,

                ),
                child: Text('Products',
                  style: TextStyle(color: Colors.black, fontSize: 24),),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  _updateContent('Home');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  _updateContent('Settings');
                  Navigator.pop(context);
                },


              )
            ],
          ),
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    if (_content == 'Home') {
      return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                itemList[index]),
            onTap: () {},

          );
        },
      );
    } else if (_content == 'Settings') {
      return const Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star),
              SizedBox(width: 10),
              Text('Apple'),
              Icon(Icons.favorite),
              SizedBox(width: 10),
              Text('Chrome Book'),

            ])
        ,);
    } else {
      return Center(child: Text(_content),);
    }
  }

}
