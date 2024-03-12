import 'package:flutter_new_app/view_model/details.viewmodel.dart';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  final DetailsViewModel _detailsViewModel = DetailsViewModel(); //access the Detailsviewmodel

  @override
  void initState() {
    super.initState();
    _detailsViewModel.apiCall();
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250.0,
                        child: Image.network(
                          _detailsViewModel.details["image"],
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
                              _detailsViewModel.details["streetAddress"]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22.0),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                _detailsViewModel.details["area"] +
                                    ',' +
                                    _detailsViewModel.details["municipality"],
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
                                '${_detailsViewModel.details["askingPrice"].toString()} SEK',
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
                            _detailsViewModel.details["description"].toString(),
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
                            _detailsViewModel.details["livingArea"].toString(),
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
                            _detailsViewModel.details["numberOfRooms"]
                                .toString(),
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
                            _detailsViewModel.details["patio"].toString(),
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
                            _detailsViewModel.details["daysSincePublish"]
                                .toString(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
