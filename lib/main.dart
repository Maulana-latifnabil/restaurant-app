import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Widget MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

// Widget LoginPage
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.tealAccent, Colors.black],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_restaurant.png',
                height: 400,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Pindah ke layar utama setelah login berhasil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.tealAccent, Colors.black],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESTAURANT BAKARAN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Alamat:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Jl. Somopuro Jiwonalan, Kabupaten Klaten, Jawa Tengah',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Telepon:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '081326033701',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Jam Buka:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '08:00 - 22:00',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Pindah ke layar menu restoran
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantMenu()),
                  );
                },
                child: Text('Lihat Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget RestaurantMenu
class RestaurantMenu extends StatefulWidget {
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

// State RestaurantMenu
class _RestaurantMenuState extends State<RestaurantMenu> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Menu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.tealAccent, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildMenuItem(
                context,
                'assets/ayambakar.jpeg',
                'Ayam Bakar',
                'Ayam Bakar Khas Klaten.',
                'Rp. 20.000',
              ),
              _buildMenuItem(
                context,
                'assets/nilabakar.jpg',
                'Nila Bakar',
                'Nila Bakar Khas Klaten.',
                'Rp. 20.000',
              ),
              _buildMenuItem(
                context,
                'assets/lelebakar.jpeg',
                'Lele Bakar',
                'Lele Bakar Khas Klaten.',
                'Rp. 20.000',
              ),
              _buildMenuItem(
                context,
                'assets/guramehbakar.jpeg',
                'Gurameh Bakar',
                'Gurameh Bakar Khas Klaten.',
                'Rp. 20.000',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Pindah ke layar keranjang dengan item yang dipilih
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen(cartItems)),
          );
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // Widget untuk membangun setiap item menu
  Widget _buildMenuItem(BuildContext context, String imagePath, String title,
      String description, String price) {
    int quantity = cartItems.indexWhere((item) => item['title'] == title);
    quantity = quantity != -1 ? cartItems[quantity]['quantity'] : 0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul menu
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Deskripsi menu
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  // Harga menu
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Input untuk jumlah pesanan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jumlah Pesanan:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 0) quantity--;
                                _updateCartItem(title, quantity);
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                                _updateCartItem(title, quantity);
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Tombol untuk memesan makanan
                  ElevatedButton(
                    onPressed: () {
                      // Tampilkan pesan bahwa item telah ditambahkan ke keranjang
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Tambahkan $title x $quantity Ke Pesanan'),
                      ));
                      // Tambahkan item ke keranjang
                      setState(() {
                        _updateCartItem(title, quantity);
                      });
                    },
                    child: Text('Pesan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk memperbarui item di keranjang
  void _updateCartItem(String title, int quantity) {
    int index = cartItems.indexWhere((item) => item['title'] == title);
    if (index != -1) {
      if (quantity > 0) {
        cartItems[index]['quantity'] = quantity;
      } else {
        cartItems.removeAt(index);
      }
    } else {
      cartItems.add({
        'title': title,
        'quantity': quantity,
        'price': 'Rp. 20.000', // Ubah dengan harga aktual dari database atau sumber lainnya
      });
    }
  }
}

// Widget CartScreen
class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen(this.cartItems);

  @override
  Widget build(BuildContext context) {
    int total = 0;
    int totalItems = 0;

    // Hitung total harga dan total item
    cartItems.forEach((item) {
      int price = _parsePrice(item['price']);
      int quantity = item['quantity'];
      int subtotal = price * quantity; // Hitung subtotal untuk setiap item
      total += subtotal; // Tambahkan subtotal ke total
      totalItems += quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(cartItems[index]['title']),
                  subtitle: Text(
                      'Jumlah: ${cartItems[index]['quantity']} x ${cartItems[index]['price']}'),
                  trailing: Text(
                      'Total: Rp. ${_parsePrice(cartItems[index]['price']) * cartItems[index]['quantity']}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Harga: Rp. $total', // Tampilkan total harga
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),  
                Text(
                  'Total Item: $totalItems',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 // Parse harga dari string ke integer
int _parsePrice(String priceString) {
  // Hapus 'Rp. ' dan koma
  String price = priceString.replaceAll('Rp. ', '').replaceAll(',', '');
  // Hapus titik sebagai pemisah ribuan
  price = price.replaceAll('.', '');
  // Parse ke integer atau kembalikan 0 jika parsing gagal
  return int.tryParse(price) ?? 0;
}

}
