// import 'package:flutter/material.dart';
// import 'package:seller_app/authScreens/forgot_password.dart';
// import 'package:seller_app/authScreens/signup_screen.dart';
// import 'package:seller_app/mainScreen/home_screen.dart';

// class SigninScreen extends StatefulWidget {
//   const SigninScreen({super.key});

//   @override
//   State<SigninScreen> createState() => _SigninScreenState();
// }

// class _SigninScreenState extends State<SigninScreen> {
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//   final TextEditingController emailTextEditingController =
//       TextEditingController();
//   final TextEditingController passwordTextEditingController =
//       TextEditingController();
//   bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/logo yellow.png', height: 100),
//               const SizedBox(height: 20),
//               const Text(
//                 'Sign In',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFFFC300),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Sign in to continue using this app',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black54,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               Form(
//                 key: formkey,
//                 child: Column(
//                   children: [
//                     // Business Email
//                     TextFormField(
//                       controller: emailTextEditingController,
//                       decoration: InputDecoration(
//                         labelText: 'Enter Business Email',
//                         labelStyle: const TextStyle(color: Colors.grey),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         prefixIcon: const Icon(Icons.email_outlined),
//                         filled: true,
//                         fillColor: Colors.white,
//                         // Focused border styling
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Color(0xFFFFC300),
//                             width: 2,
//                           ),
//                         ),
//                         // Enabled border styling
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Color(0xFFE0E0E0),
//                             width: 1.5,
//                           ),
//                         ),
//                         // Error border styling
//                         errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 1.5,
//                           ),
//                         ),
//                         // Focused error border styling
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Password Field
//                     TextFormField(
//                       controller: passwordTextEditingController,
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                         labelText: 'Enter Your Password',
//                         labelStyle: const TextStyle(color: Colors.grey),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         prefixIcon: const Icon(Icons.lock_outline),
//                         suffixIcon: IconButton(
//                           icon: Icon(_obscureText
//                               ? Icons.visibility_off
//                               : Icons.visibility),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         // Focused border styling
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Color(0xFFFFC300),
//                             width: 2,
//                           ),
//                         ),
//                         // Enabled border styling
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Color(0xFFE0E0E0),
//                             width: 1.5,
//                           ),
//                         ),
//                         // Error border styling
//                         errorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 1.5,
//                           ),
//                         ),
//                         // Focused error border styling
//                         focusedErrorBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: const BorderSide(
//                             color: Colors.red,
//                             width: 2,
//                           ),
//                         ),
//                       ),
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 10),

//                     // Forgot Password
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgotPasswordScreen()),
//                           );
//                         },
//                         child: const Text(
//                           'Forgot password?',
//                           style: TextStyle(color: Color(0xFFFFC300)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),

//                     // Create Account
//                     const Text("Don't have any account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SignupScreen()));
//                       },
//                       child: const Text(
//                         'Create account',
//                         style: TextStyle(
//                             color: Color(0xFFFFC300),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text('or'),
//                     const SizedBox(height: 10),

//                     // Social Sign-in Buttons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         _buildSocialButton(
//                             'assets/images/google icon_icon 1.png'),
//                         const SizedBox(width: 20),
//                         _buildSocialButton('assets/images/apple_icon 1.png'),
//                       ],
//                     ),
//                     const SizedBox(height: 40),

//                     // Sign In Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => const MainScreen()),
//                 );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFFFC300),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Sign in',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialButton(String assetName) {
//     return InkWell(
//       onTap: () {
//         // Implement social sign-in functionality
//       },
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: const Color(0xffC5C5C5)),
//         ),
//         child: Image.asset(assetName, height: 30),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:seller_app/authScreens/forgot_password.dart';
import 'package:seller_app/authScreens/signup_screen.dart';
import 'package:seller_app/mainScreen/home_screen.dart';
import 'package:seller_app/widget/custom_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo yellow.png', height: 100),
              const SizedBox(height: 20),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC300),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign in to continue using this app',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    // Business Email
                    CustomTextFormField(
                      controller: emailTextEditingController,
                      labelText: 'Enter Business Email',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    CustomTextFormField(
                      controller: passwordTextEditingController,
                      labelText: 'Enter Your Password',
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Color(0xFFFFC300)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                     // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const MainScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC300),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Create Account
                    const Text("Don't have any account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen()),
                        );
                      },
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                          color: Color(0xFFFFC300),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('or'),
                    const SizedBox(height: 10),

                    // Social Sign-in Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton('assets/images/google icon_icon 1.png'),
                        const SizedBox(width: 20),
                        _buildSocialButton('assets/images/apple_icon 1.png'),
                      ],
                    ),
                    const SizedBox(height: 40),

                   
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetName) {
    return InkWell(
      onTap: () {
        // Implement social sign-in functionality
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffC5C5C5)),
        ),
        child: Image.asset(assetName, height: 30),
      ),
    );
  }
}