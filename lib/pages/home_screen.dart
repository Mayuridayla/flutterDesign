import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/pages/account_screen.dart';
import 'package:sampleproject/pages/healthylife_screen.dart';
import 'package:sampleproject/pages/login_screen.dart';
import 'package:sampleproject/pages/mainpage_screen.dart';
import 'package:sampleproject/pages/promotion_screen.dart';

import 'package:sampleproject/utils/flutkart.dart';

//import 'package:sky_engine/_http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
int _selectedIndex = 2;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  bool showFirst = true;

  @override
  void initState() {
    super.initState();
//this.getJsonData();
   }



  @override
  void dispose() {
  //  animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//final appTitle = 'Orientation Demo';

//title: appTitle,
// this body(body:  OrientationList) is for Grid view 

      // body:  OrientationList(
      //  // title: 'Medplus',
      // ),
      appBar: AppBar(
        title: Text(Flutkart.name),
        actions: <Widget>[
          // Padding(
          //   child: Icon(Icons.search), 
          //   padding: const EdgeInsets.only(right: 10.0),
          // )

         IconButton(icon: Icon(Icons.search), onPressed: (){
          showSearch(context: context, delegate: DataSearch());
         })
        ],
        ),



// This body is for snack bar
     // body: SnackBarPage(),
      drawer: Drawer(
child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      new UserAccountsDrawerHeader(accountName: new Text("Mayuri Dayla"),
      accountEmail: new Text("mayuridayla@gmail.com"),
       currentAccountPicture: new CircleAvatar(
         backgroundColor: Colors.white,
         child: new Text('MD'),
       ),
otherAccountsPictures: <Widget>[
  new CircleAvatar(
    backgroundColor: Colors.white,
    child: new Text('M'),

  )
],

       ),
      
      // DrawerHeader(

      //   child: Text('MedPlus'),

      //   decoration: BoxDecoration(
      //     color: Colors.blue,
      //   ),
      // ),
      ListTile(
        title: Text('Home'),
        trailing: new Icon(Icons.home),
        onTap: () {
          // Update the state of the app.
        Navigator.pop(context);
        },
      ),
ListTile(
        title: Text('Share'),
        trailing: new Icon(Icons.share),
 
        onTap: () {
          // Update the state of the app.
Navigator.pop(context);
        },
      ),

      ListTile(
        title: Text('Logout'),
        trailing: new Icon(Icons.exit_to_app),
 
        onTap: () {
          // Update the state of the app.
Navigator.pop(context);
        },
      ),
    ],
  ),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Icon(Icons.shopping_cart, color: Colors.deepPurple),
      ),

bottomNavigationBar: CurvedNavigationBar(
  backgroundColor: Colors.deepPurple,
  items: <Widget>[
  
Icon(Icons.verified_user,size: 20,color:Colors.black ),
Icon(Icons.menu,size: 20,color:Colors.black ),
Icon(Icons.home,size: 20,color:Colors.black),
Icon(Icons.help,size: 20,color:Colors.black ),
Icon(Icons.account_box,size: 20,color:Colors.black ),
],
index: 2,


onTap:  _onItemTapped,


),

body:
// Container(color: Colors.deepPurple),
Center(
child: _widgetOptions.elementAt(_selectedIndex),
)
    );
  }
}
 List<Widget> _widgetOptions =
 [
   AccountScreen(),
   PromotionPage(),
   MainPage(),
   HedalthLife(),
   PromotionPage(),
  // MenuPage(),

 ];
 

class CardView extends StatelessWidget {
  final double cardSize;
  CardView(this.cardSize);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new SizedBox.fromSize(
      size: new Size(cardSize, cardSize),
    ));
  }
}

class DataSearch extends SearchDelegate<String>{
  final cities = [
    "Bhopal", "Indore", "Bangalore", "Delhi", "coorg", "manglore", "Mumbai"
  ];
  final recentCities =["Indore", "Bangalore"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Action for app bar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      }) ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon to the left of app bar
    return IconButton(icon: AnimatedIcon(icon:AnimatedIcons.menu_arrow  , progress: transitionAnimation,),
     onPressed:  (){
       close(context, null);
     });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result based on the selected thing

    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center( 
            child: Text(query),
          ),),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when  someone searches for somthing 
    final suggestionList = query.isEmpty?recentCities:cities.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context, index)=>ListTile(
onTap: (){
  showResults(context);
},

      leading: Icon(Icons.location_city),
    //  title: Text(suggestionList[index]),
  title: RichText(
  text: TextSpan(
  text: suggestionList[index].substring(0, query.length),
  style: TextStyle(
  color: Colors.black , fontWeight: FontWeight.bold),
  children: [TextSpan(
  text: suggestionList[index].substring(query.length),
  style: TextStyle(color:Colors.grey)

)]
)),

    ), 
    itemCount: suggestionList.length,
    );
  }
}


class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
}

}


class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text(title)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 3 : 3,
            // Generate 100 widgets that display their index in the List.
           
            children: List.generate(100, (index) {
              return Center(
                child:

               //  Text('Med $index',style: Theme.of(context).textTheme.headline,  ),
                 Icon(Icons.shopping_cart, size:40.0, color: Colors.greenAccent),
              //  Text('Med $index',style: Theme.of(context).textTheme.headline,  ),
               
              );
            }),


          );
        },
        
      ),
    );
  }

}

class NewPage extends StatelessWidget{
  final String title;
  NewPage(this.title);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
body:new Center(child: new Text(title),
),

    );
  }


}



