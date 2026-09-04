import 'package:flutter/material.dart';

void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF8BBD0)),

        scaffoldBackgroundColor: const Color(0xFFEAF8FF),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFFF7FA),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),

          labelStyle: const TextStyle(color: Color(0xFFD96F95)),

          hintStyle: const TextStyle(color: Color(0xFF8CBFD3)),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFB3E5FC), width: 1.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFF48FB1), width: 2),
          ),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _agreeTerms = false;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  final String fullName = 'Cristina Villarosa';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // =========================
  // REQUIRED GESTURES
  // =========================

  void handleSingleTap() {
    debugPrint('Hello World!');
  }

  void handleDoubleTap() {
    debugPrint('ITP107 - Mobile Application Development');
  }

  void handleLongPress() {
    debugPrint(fullName);
  }

  // =========================
  // SIGN UP
  // =========================

  void signUp() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFFF48FB1),
            content: Text('Please agree to the Terms and Conditions.'),
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF81D4FA),
          content: Text('Account created successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFF8BBD0),
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4),
          child: Divider(height: 4, thickness: 4, color: Color(0xFF81D4FA)),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Center(
            child: Container(
              width: screenWidth > 600 ? 500 : double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),

                border: Border.all(color: const Color(0xFFF8BBD0), width: 2),

                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3381D4FA),
                    blurRadius: 18,
                    offset: Offset(0, 6),
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Form(
                  key: _formKey,

                  child: Column(
                    children: [
                      // =========================
                      // HEADER ICON
                      // =========================
                      Container(
                        width: 92,
                        height: 92,

                        decoration: const BoxDecoration(
                          color: Color(0xFFF8BBD0),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.person_add_alt_1,
                          size: 46,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Create Your Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD96F95),
                        ),
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        'Fill in the information below to sign up.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4FA3C7),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // =========================
                      // FULL NAME
                      // =========================
                      TextFormField(
                        controller: _nameController,
                        textInputAction: TextInputAction.next,

                        cursorColor: const Color(0xFFF48FB1),

                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',

                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Color(0xFFF48FB1),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // EMAIL
                      // =========================
                      TextFormField(
                        controller: _emailController,

                        keyboardType: TextInputType.emailAddress,

                        textInputAction: TextInputAction.next,

                        cursorColor: const Color(0xFF81D4FA),

                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'example@email.com',

                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xFF81D4FA),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }

                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // PASSWORD
                      // =========================
                      TextFormField(
                        controller: _passwordController,

                        obscureText: _hidePassword,

                        textInputAction: TextInputAction.next,

                        cursorColor: const Color(0xFFF48FB1),

                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',

                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFF48FB1),
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },

                            icon: Icon(
                              _hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,

                              color: const Color(0xFF81D4FA),
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 6) {
                            return 'Password must have at least 6 characters';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // CONFIRM PASSWORD
                      // =========================
                      TextFormField(
                        controller: _confirmPasswordController,

                        obscureText: _hideConfirmPassword,

                        textInputAction: TextInputAction.done,

                        cursorColor: const Color(0xFF81D4FA),

                        decoration: InputDecoration(
                          labelText: 'Confirm Password',

                          hintText: 'Re-enter your password',

                          prefixIcon: const Icon(
                            Icons.lock_reset,
                            color: Color(0xFF81D4FA),
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _hideConfirmPassword = !_hideConfirmPassword;
                              });
                            },

                            icon: Icon(
                              _hideConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,

                              color: const Color(0xFFF48FB1),
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }

                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // =========================
                      // TERMS
                      // =========================
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeTerms,

                            activeColor: const Color(0xFFF48FB1),

                            checkColor: Colors.white,

                            side: const BorderSide(
                              color: Color(0xFF81D4FA),
                              width: 2,
                            ),

                            onChanged: (value) {
                              setState(() {
                                _agreeTerms = value ?? false;
                              });
                            },
                          ),

                          const Expanded(
                            child: Text(
                              'I agree to the Terms and Conditions.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF4FA3C7),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // =========================
                      // SIGN UP BUTTON
                      // =========================
                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton(
                          onPressed: signUp,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8BBD0),

                            foregroundColor: Colors.white,

                            elevation: 0,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),

                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      const Divider(color: Color(0xFFB3E5FC), thickness: 2),

                      const SizedBox(height: 20),

                      // =========================
                      // GESTURE ACTIVITY
                      // =========================
                      const Text(
                        'Gesture Activity',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD96F95),
                        ),
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        'Tap, double tap, or long press the button below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4FA3C7),
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // GESTURE BUTTON
                      // =========================
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        onTap: handleSingleTap,
                        onDoubleTap: handleDoubleTap,
                        onLongPress: handleLongPress,

                        child: IgnorePointer(
                          child: SizedBox(
                            width: double.infinity,
                            height: 52,

                            child: ElevatedButton.icon(
                              onPressed: () {},

                              icon: const Icon(Icons.touch_app),

                              label: const Text(
                                'Click Me',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF81D4FA),

                                foregroundColor: Colors.white,

                                elevation: 0,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // =========================
                      // GESTURE GUIDE
                      // =========================
                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F5),

                          borderRadius: BorderRadius.circular(15),

                          border: Border.all(
                            color: const Color(0xFFB3E5FC),
                            width: 1.5,
                          ),
                        ),

                        child: const Column(
                          children: [
                            GestureInfo(
                              icon: Icons.touch_app,
                              title: 'Single Tap',
                              description: 'Prints "Hello World!"',
                              usePink: true,
                            ),

                            SizedBox(height: 12),

                            GestureInfo(
                              icon: Icons.ads_click,
                              title: 'Double Tap',
                              description:
                                  'Prints ITP107 course code and description',
                              usePink: false,
                            ),

                            SizedBox(height: 12),

                            GestureInfo(
                              icon: Icons.pan_tool_alt,
                              title: 'Long Press',
                              description: 'Prints your full name',
                              usePink: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'ITP107 • Mobile Application Development',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4FA3C7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =========================
// GESTURE INFO
// =========================

class GestureInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool usePink;

  const GestureInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.usePink,
  });

  @override
  Widget build(BuildContext context) {
    final Color mainColor = usePink
        ? const Color(0xFFF8BBD0)
        : const Color(0xFFB3E5FC);

    final Color textColor = usePink
        ? const Color(0xFFD96F95)
        : const Color(0xFF4FA3C7);

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(icon, size: 21, color: Colors.white),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              ),

              Text(
                description,
                style: TextStyle(fontSize: 12, color: textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
