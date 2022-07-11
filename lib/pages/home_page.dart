import 'package:coffee/util/coffe_tile.dart';
import 'package:coffee/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  // list of coffee types

  final List coffeeType =[
    ['Cappucino',true],
    ['Latte',false],
    ['Black',false],
    ['Tea',false],

  ];


// user tapped on coffee types
  void coffeTypeSelected(int index){
    setState((){
      for(int i=0;i<coffeeType.length;i++){
        coffeeType[i][1]=false;

      }
      coffeeType[index][1]=true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [Padding(
          padding: const EdgeInsets.only(right:25.0),
          child: Icon(Icons.person),
        )],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: ''),
      ]),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Find the best coffee for you',
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
            ),
          ),
          SizedBox(height: 25,),

          // Search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)
                )
              ),
            ),
          ),
          SizedBox(height: 25,),

          // horizontal listview of coffee types
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context,index){
              return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: (){
                    coffeTypeSelected(index);
                  }
              );
            },
            ),
          ),

          // horizontal listview of coffee tiles
            Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeImagePath: 'lib/coffe/coffee1.jpg',
                  coffeeName: 'Latte',
                  coffePrice: '4.20',
                ),

                CoffeeTile(
                  coffeImagePath: 'lib/coffe/milk.jpg',
                  coffeeName: 'Milk',
                  coffePrice: '4.60',
                ),
                CoffeeTile(
                  coffeImagePath: 'lib/coffe/coffee2.png',
                  coffeeName: 'Cappucino',
                  coffePrice: '4.10',
                ),
              ],
            ))
        ],
      )
    );
  }
}
