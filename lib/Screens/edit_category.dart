import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/category_services.dart';
import 'package:flutterapp/components/category.dart';

class edit extends StatefulWidget {
  const edit({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController? etCategory;

  doEditCategory() async {
    final name = etCategory?.text;
    final response = await AuthServices().editCategory(widget.category, name!);
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    etCategory = TextEditingController(text: widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        backgroundColor: Color.fromARGB(255, 134, 125, 216),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: const TextStyle(
                  fontFamily: 'Raleway',
                ),
                controller: etCategory,
                decoration: InputDecoration(
                  labelText: 'Name Category',
                  labelStyle: const TextStyle(
                    fontFamily: 'Raleway',
                  ),
                  prefixIcon: const Align(
                    widthFactor: 3.2,
                    heightFactor: 1.5,
                    child: Icon(
                      Icons.card_membership_sharp,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow.shade100),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.yellow.shade100,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    doEditCategory();
                  },
                  child: const Text(
                    "Edit Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
