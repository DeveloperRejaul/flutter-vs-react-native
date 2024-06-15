import 'package:flutter/material.dart';
import 'package:flutter_app/provider/shop_app_provider.dart';
import 'package:provider/provider.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({super.key});

  @override
  State<ShopCard> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCard> {
  @override
  Widget build(BuildContext context) {
    final cartsState = context.watch<ShopAppProvider>();
    final carts = cartsState.getCarts;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(carts[index]['imageUrl'] as String),
              ),
              title: Text(carts[index]['title'] as String),
              subtitle: Text(
                "Size ${(carts[index]['size'] as int).toString()}",
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Are you sure you ??',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      content: const Text('Items is delete from cart'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cartsState.removeCard(carts[index]);
                            Navigator.pop(context, 'OK');
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
