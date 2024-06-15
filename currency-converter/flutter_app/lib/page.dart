import 'package:flutter/material.dart';

class APPMaterial extends StatefulWidget {
  const APPMaterial({super.key});

  @override
  State<APPMaterial> createState() => _APPMaterialState();
}

class _APPMaterialState extends State<APPMaterial> {
  double result = 0.0;
  final myController = TextEditingController();

  void handleInput(String text) {
    // if(text !="") {
    //   result = double.parse(text) * 120;
    // }
    // setState(() {});
  }

  void handlePress() {
    if (myController.text != "") {
      result = double.parse(myController.text) * 120;
      myController.text = "";
    }
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TK ${result.toStringAsFixed(1)}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:  InputDecoration(
                  hintText: 'Enter Currency',
                  prefixIcon: const Icon(Icons.monetization_on_outlined, color: Colors.black,),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.number,
                controller: myController,
                onChanged: handleInput,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(10),
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                    minimumSize: WidgetStateProperty.all(
                        const Size(double.infinity, 50)),
                    shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Colors.black)))),
                onPressed: handlePress,
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    // backgroundColor: Colors.black,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
