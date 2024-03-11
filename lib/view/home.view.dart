



import 'package:flutter/material.dart';
import 'package:flutter_new_app/model/homemodel.dart';
import 'package:flutter_new_app/view/Details.view.dart';
import 'package:flutter_new_app/view_model/home.viewmodel.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 List<Items>  modelitems = [];



  @override
  Widget build(BuildContext context) {

    final homeViewModel = Provider.of<HomeViewModel>(context);

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

      body:modelitems.isNotEmpty
          ? Padding(
            padding: const EdgeInsets.all(20.0),
            
              child: ListView.builder(
                itemCount:modelitems.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Column(
                      children: [
                        modelitems[index].type!= "HighlightedProperty" ? const Text("") : const Align(
                           alignment: Alignment.centerLeft,
                          child:  Text("Area" ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20.0),)),const SizedBox(height: 8.0,) ,
                        modelitems[index] == 0 ?  GestureDetector(
                          onTap: (){
                         
                             Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const DetailPage())));
                          },
                          child: Container(
                            height: 250.0,
                            decoration: BoxDecoration(border: Border.all(color: Colors.yellow, width: 5,)),
                            child: Image.network(modelitems[index].image.toString(),width: double.maxFinite,fit:BoxFit.cover, ),
                          ),
                        )

                       : SizedBox(
                          height: 150.0,
                          
                          child: Image.network(modelitems[index].image.toString(),fit: BoxFit.cover, width: double.maxFinite,),
                        ),
                        const SizedBox(height: 20.0,),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                modelitems[index].streetAddress ??  modelitems[index].area.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            const SizedBox(height: 8.0,),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  modelitems[index].area != null ? modelitems[index].municipality != null ?  '${modelitems[index].area},${modelitems[index].municipality}' : "Rating:${modelitems[index].ratingFormatted}"  : "",
                                  style: const TextStyle(color: Colors.grey),
                                )),
                          ],
                        ),
                         const SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              modelitems[index].askingPrice!= null ? modelitems[index].askingPrice.toString() : "Average price :${modelitems[index].averagePrice}M²" ,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              modelitems[index].livingArea != null ? '${modelitems[index].livingArea.toString()}M²' : "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              modelitems[index].numberOfRooms != null ? '${modelitems[index].numberOfRooms.toString()}rooms' : "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                         const SizedBox(height: 40.0,),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(
            child: Column(
              children: [
               
                  Image.network("https://img.freepik.com/premium-vector/real-estate-home-business-logo-design-template_758228-41.jpg",width:double.maxFinite,),
               
                ElevatedButton(
                    child: const Text("Open Now!"),
                    onPressed: () {
                      homeViewModel.readJson();
                    },
                  ),
              ],
            ),
          ),
    );
  }
}
