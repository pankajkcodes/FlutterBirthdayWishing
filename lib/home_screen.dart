import 'package:birthday_wishing/constant.dart';
import 'package:birthday_wishing/wish_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppConstant.height(context),
        width: AppConstant.width(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/bg.jpeg"))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppConstant.height(context) * 0.4,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 21),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(21))),
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                      hintText: "Type Name of loved one's",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: AppConstant.height(context) * 0.04,
              ),
              Container(
                width: AppConstant.width(context),
                height: AppConstant.height(context) * 0.06,
                margin: EdgeInsets.symmetric(horizontal: 21),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(21))),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishScreen(
                                      name: controller.text,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please Enter Name')));
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
