import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task2/controller/controller.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<homescreencontroller>(context, listen: false).fetchdata();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<homescreencontroller>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Products",
          style: TextStyle(fontSize: 25, color: Colors.black),
        )),
      ),
      body: provider.isProductloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final data = provider.fetcheditems?[index];
                return Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(),
                              
                              image: DecorationImage(
                                image: NetworkImage(data?.image ??
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRacb74og5L8lqvlWiiECKiAgCf5KMDVvqidU9NTcUmYw&s'),
                                opacity: 0.6,
                              ),
                              backgroundBlendMode: BlendMode.softLight,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            bottom: 0,
                            left: 16,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  data?.title ?? "",
                                  style:GoogleFonts.italiana(  fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                    ) 
                                  
                                 
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee_sharp,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Colors.grey),
                                          child: Text(
                                            data?.price.toString() ?? "",
                                            style:GoogleFonts.italiana(  fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                    ) 
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 260,
                            right: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "ID:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Container(
                                          child: Text(
                                            data?.price.toString() ?? "",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
