import 'package:flutter/material.dart';
import 'package:test_app/screen/users.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  bool get isFilled =>
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
           Visibility(
            visible: !(emailFocusNode.hasFocus || passwordFocusNode.hasFocus),
            child: Padding(
              padding: const EdgeInsets.only(top: 200,left: 40),
              child: Text('Выход',
                  style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight:FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 327,
              height: 348,
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
              padding: EdgeInsets.all(50.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: emailFocusNode.hasFocus
                            ? Color(0xFF9B51E0)
                            : Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 44, 43, 43)),
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                  SizedBox(height: 25.0),
                  TextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: passwordFocusNode.hasFocus
                            ? Color(0xFF9B51E0)
                            : Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 44, 43, 43)),
                      ),
                    ),
                    obscureText: true,
                    onChanged: (value) => setState(() {}),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 214,
                    height: 38,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled))
                              return Color(0xFF9B51E0).withOpacity(0.5);
                            return Color(0xFF9B51E0);
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      onPressed: isFilled
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsersPage()),
                              );
                            }
                          : null, 
                      child: Text(
                        'Войти',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
