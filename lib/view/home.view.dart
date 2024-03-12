



import 'package:flutter/material.dart';
import 'package:flutter_new_app/model/homemodel.dart';
import 'package:flutter_new_app/view/Details.view.dart';
import 'package:flutter_new_app/view_model/home.viewmodel.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 final HomeViewModel _homeViewModel = HomeViewModel();//access the view model

 @override
  void initState() {
    super.initState();
    _homeViewModel.readJson();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.align_horizontal_right,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Sale Page',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.align_horizontal_left,
              color: Colors.white,
            ),
          ],
        ),
      ),
      //______________________________________________________LISTVIEW____________________________________________________________________

      body:FutureBuilder(
        future: _homeViewModel.readJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _homeViewModel.modelitems.length,
                itemBuilder: (context, index) {
                  Items item = _homeViewModel.modelitems[index];
              
                  return SizedBox(
                      child: Column(
                        children: [
                          item.type != "Area" ? const Text("") :const Align(
                             alignment: Alignment.centerLeft,
                            
                            child:  Text("Area" ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20.0),)),const SizedBox(height: 8.0,) ,
                            
                            item.type == "HighlightedProperty" ?  GestureDetector(
                            onTap: (){
                           
                               Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const DetailPage())));
                            },
                            child: Container(
                              height: 250.0,
                              decoration: BoxDecoration(border: Border.all(color: Colors.yellow, width: 5,)),
                              child: Image.network(item.image.toString(),width: double.maxFinite,fit:BoxFit.cover, ),
                            ),
                          )
                  
                         : SizedBox(
                            height: 150.0,
                            
                            child: Image.network(item.image.toString(),fit: BoxFit.cover, width: double.maxFinite,),
                          ),
                  
                  
                          const SizedBox(height: 20.0,),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.streetAddress ??  item.area.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ),
                              const SizedBox(height: 8.0,),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.area != null ? item.municipality != null ?  '${item.area},${item.municipality}' : "Rating:${item.ratingFormatted}"  : "",
                                    style: const TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                           const SizedBox(height: 8.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.askingPrice!= null ? item.askingPrice.toString() : "Average price :${item.averagePrice}M²" ,
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item.livingArea != null ? '${item.livingArea.toString()}M²' : "",
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item.numberOfRooms != null ? '${item.numberOfRooms.toString()}rooms' : "",
                                style:
                                    const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                           const SizedBox(height: 20.0,),
                        ],
                      ),
                    );
                },
              ),
            );
          }
        },
      ),
      
      
    );
  }
}
