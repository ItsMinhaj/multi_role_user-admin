import 'package:flutter/material.dart';
import 'package:multi_role/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String userEmail = "";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userEmail = sp.getString("email") ?? "No User Found";

    setState(() {});
    return userEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "User Email : $userEmail",
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setBool("isLogin", false);
                  sp.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Center(child: Text("Logout")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
