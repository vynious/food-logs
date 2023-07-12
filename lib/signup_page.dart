import "package:flutter/material.dart";
import "package:foodlog/components/auth_textfield.dart";


class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final usernamecController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),


            Container(
              padding: const EdgeInsets.only(left: 45.0),
              child: Image.asset(
                'assets/signup-man.png',
                width: 250,
                height: 250,
              )
            ),


            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4.0, top: 5.0),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),



            const SizedBox(height: 25),
            MyTextField(
              controller:usernamecController,
              hintText: 'Username',
              obscureText: false,
              placeholder: 'Username',
            ),



            const SizedBox(height: 25),

            MyTextField(
              controller:passwordController,
              hintText: 'Email',
              obscureText: false,
              placeholder: 'Email',
            ),

            const SizedBox(height: 25),


            MyTextField(
              controller:passwordController,
              hintText: 'Password',
              obscureText: true,
              placeholder: 'Password',
            ),
            const SizedBox(height: 25),

            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform action for Button 1
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.black)), // Set the text color to black
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFFF2E1CB), // Set the background color to light grey

                    ),
                  ),
                ),
                const SizedBox(height: 16.0), // Add spacing between the buttons
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform action for Button 2
                    },
                    child: Text('Log In', style: TextStyle(color: Colors.black)), // Set the text color to black
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xFFF6F6F6), // Set the background color to light grey

                    ),
                  ),
                ),
              ],
)

          ],
        )
        ),
        
    );
  }
}