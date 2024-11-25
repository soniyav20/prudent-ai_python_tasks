import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'upload_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController(text: "prudentuser");
  final TextEditingController _passwordController = TextEditingController(text: "prudent123");
  final AuthService _authService = AuthService();
  bool passhide=true;
  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final success = await _authService.login(username, password);
  print(success);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UploadScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(child: Text("Prudent Image Resizer",style: TextStyle(
                color: Colors.white,fontSize: 40
              ),textAlign: TextAlign.center,)),
              width: double.infinity,
              height: 300,
              decoration:
              BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200))
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.teal,
                controller: _usernameController,
                decoration:  InputDecoration(labelText: 'Username',border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.teal,
                        controller: _passwordController,
                        decoration:  InputDecoration(labelText: 'Password',border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),),
                        obscureText: passhide,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                        passhide=!passhide;
                      });
                    }, icon: Icon(passhide?Icons.visibility:Icons.visibility_off))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: _login,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
