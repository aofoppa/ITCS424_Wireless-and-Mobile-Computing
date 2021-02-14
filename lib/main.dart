import 'package:flutter/material.dart';
// Paramin Phokabutr 6188082  
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    return MaterialApp(
      title: 'ESTEE LAUDER Shop',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'ESTEE LAUDER Shop'),
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
  int _counter = 0;
  final items = List<String>.generate(10, (i) => "Item $i");
  int totalAmount = 0;
  List picked = [false, false, false, false, false,false, false, false, false, false];
  final ItemList = ['Advanced Night Repair Synchronized Multi-Recovery Complex',
    'Micro Essence Skin Activating Treatment Lotion',
    'Revitalizing Supreme+ Night Intensive Restorative Crème',
    'Advanced Night Repair Concentrated Recovery Eye Mask',
    'Resilience Lift Multi-Effect Tri-Peptide Eye Creme',
    'Double Wear Stay In Place Makeup SPF10/PA++',
    'Nutritious Super-Pomegranate Radiant Energy Night Crème',
    'Pure Color Envy Color Replenish Lip Balm',
    'Perfectionist Pro Multi- Defense UV Fluid SPF 45/PA++++',
    'Nutritious Super-Pomegranate Radiant Energy Lotion Intense Moist'];
  final imagelist = ['1.jpg','2.jpg','3.jpg','4.jpg','5.jpg','6.jpg','7.jpg','8.jpg','9.jpg','10.jpg'];
  final price = [4700,3500,2800,1600,2900,2000,3100,1200,2200,2100];

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 0;
          for(int i = 0; i < picked.length; i++)
          {
            if (picked[i]) {
              totalAmount = totalAmount + price[i];
            }
          }
        });
      }
    }
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      ListView.builder(
        itemCount: ItemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/'+imagelist[index]),
            ),
            title: Text(ItemList[index], style: TextStyle(fontSize: 16),),
            onTap: () {
              pickToggle(index);
            },

            subtitle: Text('Price \฿ ${price[index]} '),
          );
        },

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: Container(
          child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total: \฿'+ totalAmount.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {},
                          elevation: 0.5,
                          color: Colors.orangeAccent,
                          child: Center(
                            child: Text(
                              'Check Out',
                            ),
                          ),
                          textColor: Colors.white,
                        ),
                      )
                    ]),
              ))
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}