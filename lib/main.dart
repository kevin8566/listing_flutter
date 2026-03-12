import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Product Layout'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Listing", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const <Widget> [
            ProductBox(
                name: "iPhone",
                description: "iPhone is the stylist phone ever",
                price: 1000,
                image: "iphone.jpg" 
            ),
            ProductBox(
                name: "Mouse & Keyboard",
                description: "Pixel is the most featureful phone ever",
                price: 800,
                image: "mouse&keyboard.jpg" 
            ),
            ProductBox(
                name: "Laptop",
                description: "Laptop is most productive development tool",
                price: 2000,
                image: "laptop.jpg" 
            ),
            ProductBox(
                name: "Tablet",
                description: "Tablet is the most useful device ever for meeting",
                price: 1500,
                image: "tablet.jpg" 
            ),
            ProductBox(
                name: "Pendrive",
                description: "Pendrive is useful storage medium",
                price: 100,
                image: "pendrive.png" 
            ),
            ProductBox(
                name: "Floppy Drive",
                description: "Floppy drive is useful rescue storage medium",
                price: 20,
                image: "floppydrive.jpg" 
            ),
          ],
        )
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key, 
    required this.name, 
    required this.description, 
    required this.price, 
    required this.image
  });

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2), 
        height: 120,  
        child: Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: <Widget>[
              Image.asset(
                "assets/appimages/$image", 
                width: 80, 
                height: 80, 
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 50, color: Colors.grey)
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                          // LOGIKA BARU: Menggunakan Column untuk menampung Gambar dan Teks
                          content: Column(
                            mainAxisSize: MainAxisSize.min, // Memastikan pop-up tidak memanjang penuh ke layar
                            children: [
                              // Menampilkan gambar di dalam pop-up
                              Image.asset(
                                "assets/appimages/$image",
                                height: 150, // Tinggi gambar di pop-up
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                              ),
                              const SizedBox(height: 20), // Spasi antara gambar dan teks
                              // Menampilkan teks deskripsi
                              Text(
                                "Detail Produk:\n$description\n\nHarga: \$$price", 
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Tutup", style: TextStyle(color: Colors.deepPurple)),
                              onPressed: () {
                                Navigator.of(context).pop(); 
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5), 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), 
                        Text(description, maxLines: 2, overflow: TextOverflow.ellipsis), 
                        Text("Price: \$$price", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ),
                )
              )
            ]
          )
        )
    );
  }
}