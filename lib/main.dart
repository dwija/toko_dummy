// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:toko_dummy/ui/produk_ui.dart';
import 'package:toko_dummy/model/produk.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Toko Dummy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProdukUi())],
      child: Consumer<ProdukUi>(builder: (context, produkprovider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Toko Dummy [Dwija Saptahadi]',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.8),
            child: produkprovider.isLoading
                ? Center(
                    child: const CircularProgressIndicator(
                    color: Color(0xFF37AEEE),
                  ))
                : ListView.builder(
                    itemCount: produkprovider.product.length,
                    itemBuilder: (context, index) {
                      Product data = produkprovider.product[index];
                      return InkWell(
                        onTap: () async {
                          //detail
                          onClick();
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          child: ListTile(
                            leading: Image.network(
                              data.thumbnail,
                            ),
                            title: Text(
                              data.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }

  void onClick() {}
}
