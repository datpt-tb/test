import 'package:flutter/material.dart';
import 'package:flutter_user/login.dart';
import 'package:flutter_user/navbar.dart';
import 'package:flutter_user/service.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String name1;
  HomePage({required this.name1, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _MyWidgetState(name: name1);
}

class _MyWidgetState extends State<HomePage> {
  final String name;
  AuthService appAuth = AuthService();

  _MyWidgetState({required this.name});
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Navbar(name: name),
        appBar: AppBar(
          title: const Text('Trang chủ'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 50.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('Xin chào: $name'),
              ElevatedButton(
                  child: const Text('Đăng xuất'),
                  onPressed: () {
                    appAuth.logout().then((_) =>
                        //Navigator.of(context).pushReplacementNamed('/login')
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyLogin(maNhanVien: name))));
                  })
            ],
          ),
        ),
      );
}
