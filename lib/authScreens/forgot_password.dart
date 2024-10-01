import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seller_app/authScreens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login & Reset Password',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: ForgotPasswordScreen(),
    );
  }
}

Widget _buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  IconData? prefixIcon,
  bool obscureText = false,
  Widget? suffixIcon,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  TextAlign textAlign = TextAlign.start, // Default to left alignment
  Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    textAlign: textAlign,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Color(0xFFFFC300),
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Color(0xFFE0E0E0),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    ),
  );
}

// FORGOT PASSWORD SCREEN
class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo yellow.png', height: 50),
                const SizedBox(height: 20),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('MAIL ADDRESS HERE',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                    'Enter the mail address associated with your account'),
                const SizedBox(height: 40),
                _buildTextFormField(
                  controller: emailController,
                  labelText: 'Enter Business Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailVerificationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Recover Email',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// EMAIL VERIFICATION SCREEN
class EmailVerificationScreen extends StatelessWidget {
  final List<TextEditingController> codeControllers =
      List.generate(4, (index) => TextEditingController());

  EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo yellow.png', height: 50),
                const SizedBox(height: 20),
                const Text(
                  'Email Verification',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('GET YOUR CODE',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                    'Please enter the 4-digit code that send to your email address.'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: _buildTextFormField(
                        controller: codeControllers[index],
                        labelText: '', // No label for this specific field
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context)
                                .nextFocus(); // Move to the next field
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Implement resend functionality
                  },
                  child: const Text("If you don't receive code! Resend",
                      style: TextStyle(color: Colors.amber)),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Verify and Proceed',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// RESET PASSWORD SCREEN
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo yellow.png', height: 50),
                const SizedBox(height: 20),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Enter New Password',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                    'Your new password must be different from your previously used password.'),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: newPasswordController,
                  labelText: 'Enter New Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscureNewPassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm New Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Reset Password',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
