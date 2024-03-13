

import 'package:flutter_new_app/model/detailsmodel.dart';
import 'package:flutter_new_app/view_model/details.viewmodel.dart';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


 final DetailsViewModel _detailsViewModel = DetailsViewModel();//access the view model

  @override
  void initState() {
    super.initState();
    _detailsViewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.align_horizontal_right,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Text(
                'View Page',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Icon(
                Icons.align_horizontal_left,
                color: Colors.white,
              ),
              const SizedBox(
                width: 140.0,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
          ),
        ),

// details_____________________________________

          body:FutureBuilder(
        future: _detailsViewModel.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: _detailsViewModel.details.length,
                itemBuilder: (context, index) {
                  Details details = _detailsViewModel.details[index];

                  return Column(
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250.0,
                              child: Image.network(
                                details.image.toString(),
                              
                                fit: BoxFit.cover,
                                width: double.maxFinite,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                   details.streetAddress.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22.0),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${details.area},${details.municipality}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${details.askingPrice.toString()} SEK',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                   details.description.toString(),
                                  style: const TextStyle(height: 2.0),
                                )),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Living area:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                   details.livingArea.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Number of rooms:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                   details.numberOfRooms.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Patio:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                   details.patio.toString(),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Days since publish:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                   details.daysSincePublish.toString(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),








































        // body: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           child: Column(
        //             children: [
        //               SizedBox(
        //                 height: 250.0,
        //                 child: Image.network(
        //                   // _detailsViewModel.details["image"].toString(),
        //                   "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg",
        //                   fit: BoxFit.cover,
        //                   width: double.maxFinite,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 15.0,
        //               ),
        //               Column(
        //                 children: [
        //                   Align(
        //                     alignment: Alignment.centerLeft,
        //                     child: Text(
        //                       _detailsViewModel.details[1].streetAddress.toString(),
        //                       style: const TextStyle(
        //                           fontWeight: FontWeight.bold, fontSize: 22.0),
        //                     ),
        //                   ),
        //                   Align(
        //                       alignment: Alignment.centerLeft,
        //                       child: Text(
        //                         '${_detailsViewModel.details[2].area},${_detailsViewModel.details[].municipality}',
        //                         style: const TextStyle(
        //                           color: Colors.grey,
        //                         ),
        //                       )),
        //                   const SizedBox(
        //                     height: 5.0,
        //                   ),
        //                   Align(
        //                       alignment: Alignment.centerLeft,
        //                       child: Text(
        //                         '${ _detailsViewModel.details[0].askingPrice.toString()} SEK',
        //                         style: const TextStyle(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 18.0),
        //                       )),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 10.0,
        //               ),
        //               Align(
        //                   alignment: Alignment.centerLeft,
        //                   child: Text(
        //                      _detailsViewModel.details[0].description.toString(),
        //                     style: const TextStyle(height: 2.0),
        //                   )),
        //               const SizedBox(
        //                 height: 30.0,
        //               ),
        //               Row(
        //                 children: [
        //                   const Text(
        //                     "Living area:",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text(
        //                      _detailsViewModel.details[0].livingArea.toString(),
        //                   )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 5.0,
        //               ),
        //               Row(
        //                 children: [
        //                   const Text(
        //                     "Number of rooms:",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text(
        //                      _detailsViewModel.details[0].numberOfRooms.toString(),
        //                   )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 5.0,
        //               ),
        //               Row(
        //                 children: [
        //                   const Text(
        //                     "Patio:",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text(
        //                      _detailsViewModel.details[0].patio.toString(),
        //                   )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 5.0,
        //               ),
        //               Row(
        //                 children: [
        //                   const Text(
        //                     "Days since publish:",
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   ),
        //                   Text(
        //                      _detailsViewModel.details[0].daysSincePublish.toString(),
        //                   )
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
