import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/sign%20in.dart';
import 'package:untitled/userform.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 80),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Welcome buddy",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.deepOrange),
                            ),
                            Text(
                              "Glad to see you my buddy.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "something@gmail.com",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF414041),
                                      ),
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.deepOrange,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Container(
                                height: 48,
                                width: 41,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: visible,
                                  onFieldSubmitted: (value) {
                                    print(value);
                                  },
                                  onChanged: (value) {
                                    print(value);
                                  },
                                  //obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "password must be 6 character",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF414041),
                                    ),
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepOrange,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: visible == false
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        onPressed: () {
                                          visible = !visible;
                                          print(visible);
                                          setState(() {});
                                        }),
                                  ),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black26,
                  child: MaterialButton(
                    onPressed: () async {
                      print(emailController.text);
                      print(passwordController.text);
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        print(value.user);
                      }).catchError((error) {
                        print(error.toString());
                      });
                      setState(() {});
                    },
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserForm()));
                    },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account?'),
                    TextButton(
                        onPressed: () {
                          // print("register");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
