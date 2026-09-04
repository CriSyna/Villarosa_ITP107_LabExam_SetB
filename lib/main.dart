import 'package:flutter/material.dart';

void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    // =====================================================
    // WHEREISIT-INSPIRED COLOR PALETTE
    // =====================================================
    const darkBrown = Color(0xFF7A4314);
    const deepBrown = Color(0xFF65360F);
    const mediumBrown = Color(0xFF95612F);
    const warmTan = Color(0xFFD8B77B);
    const lightTan = Color(0xFFEED8A6);
    const paleCream = Color(0xFFFFF4C7);
    const softCream = Color(0xFFFFF9DF);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: darkBrown,
          brightness: Brightness.light,
        ),

        scaffoldBackgroundColor: paleCream,

        appBarTheme: const AppBarTheme(
          backgroundColor: paleCream,
          foregroundColor: darkBrown,
          centerTitle: true,
          elevation: 0,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: softCream,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),

          labelStyle: const TextStyle(color: mediumBrown),

          hintStyle: TextStyle(color: mediumBrown.withValues(alpha: 0.65)),

          prefixIconColor: darkBrown,
          suffixIconColor: darkBrown,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: warmTan),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: warmTan, width: 1.2),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: darkBrown, width: 2),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFB3261E)),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFB3261E), width: 2),
          ),
        ),

        cardTheme: CardThemeData(
          color: softCream,
          elevation: 2,
          shadowColor: darkBrown.withValues(alpha: 0.15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: lightTan),
          ),
        ),

        dividerTheme: const DividerThemeData(color: lightTan, thickness: 1),
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
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _agreeTerms = false;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  final String fullName = 'Cristina Villarosa';

  // =====================================================
  // WHEREISIT-INSPIRED COLOR PALETTE
  // =====================================================

  static const Color darkBrown = Color(0xFF7A4314);
  static const Color deepBrown = Color(0xFF65360F);
  static const Color mediumBrown = Color(0xFF95612F);
  static const Color warmTan = Color(0xFFD8B77B);
  static const Color lightTan = Color(0xFFEED8A6);
  static const Color paleCream = Color(0xFFFFF4C7);
  static const Color softCream = Color(0xFFFFF9DF);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // =====================================================
  // REQUIRED GESTURES
  // =====================================================

  void handleSingleTap() {
    debugPrint('Hello World!');
  }

  void handleDoubleTap() {
    debugPrint('ITP107 - Mobile Application Development');
  }

  void handleLongPress() {
    debugPrint(fullName);
  }

  // =====================================================
  // SIGN-UP FUNCTION
  // =====================================================

  void signUp() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please agree to the Terms and Conditions.'),
            backgroundColor: darkBrown,
          ),
        );

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: darkBrown,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold, color: darkBrown),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Center(
            child: SizedBox(
              width: screenWidth > 600 ? 520 : double.infinity,

              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Form(
                    key: _formKey,

                    child: Column(
                      children: [
                        // =====================================================
                        // HEADER ICON
                        // =====================================================
                        Container(
                          width: 85,
                          height: 85,

                          decoration: const BoxDecoration(
                            color: lightTan,
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.person_add_alt_1,
                            size: 44,
                            color: darkBrown,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Create Your Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: darkBrown,
                          ),
                        ),

                        const SizedBox(height: 7),

                        const Text(
                          'Fill in the information below to sign up.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: mediumBrown),
                        ),

                        const SizedBox(height: 28),

                        // =====================================================
                        // 1. FULL NAME
                        // =====================================================
                        TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,

                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            prefixIcon: Icon(Icons.person_outline),
                          ),

                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your full name';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // =====================================================
                        // 2. EMAIL ADDRESS
                        // =====================================================
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,

                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'example@email.com',
                            prefixIcon: Icon(Icons.email_outlined),
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

                        // =====================================================
                        // 3. PHONE NUMBER
                        // =====================================================
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,

                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone number',
                            prefixIcon: Icon(Icons.phone_outlined),
                          ),

                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your phone number';
                            }

                            if (value.trim().length < 10) {
                              return 'Please enter a valid phone number';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        // =====================================================
                        // 4. PASSWORD
                        // =====================================================
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _hidePassword,
                          textInputAction: TextInputAction.next,

                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',

                            prefixIcon: const Icon(Icons.lock_outline),

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

                        // =====================================================
                        // 5. CONFIRM PASSWORD
                        // =====================================================
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _hideConfirmPassword,
                          textInputAction: TextInputAction.done,

                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password',

                            prefixIcon: const Icon(Icons.lock_reset),

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

                        // =====================================================
                        // TERMS AND CONDITIONS
                        // =====================================================
                        Row(
                          children: [
                            Checkbox(
                              value: _agreeTerms,
                              activeColor: darkBrown,
                              checkColor: Colors.white,

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
                                  color: deepBrown,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // =====================================================
                        // SIGN UP BUTTON
                        // =====================================================
                        SizedBox(
                          width: double.infinity,
                          height: 54,

                          child: ElevatedButton.icon(
                            onPressed: signUp,

                            icon: const Icon(Icons.person_add),

                            label: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkBrown,
                              foregroundColor: Colors.white,
                              elevation: 0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        const Divider(),

                        const SizedBox(height: 20),

                        // =====================================================
                        // GESTURE ACTIVITY
                        // =====================================================
                        const Text(
                          'Gesture Activity',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: darkBrown,
                          ),
                        ),

                        const SizedBox(height: 7),

                        const Text(
                          'Tap, double tap, or long press the button below.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: mediumBrown, fontSize: 13),
                        ),

                        const SizedBox(height: 16),

                        // =====================================================
                        // REQUIRED GESTURE DETECTOR
                        // =====================================================
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,

                          onTap: handleSingleTap,

                          onDoubleTap: handleDoubleTap,

                          onLongPress: handleLongPress,

                          child: IgnorePointer(
                            child: SizedBox(
                              width: double.infinity,
                              height: 54,

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
                                  backgroundColor: darkBrown,
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

                        // =====================================================
                        // GESTURE GUIDE
                        // =====================================================
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            color: paleCream,
                            borderRadius: BorderRadius.circular(15),

                            border: Border.all(color: lightTan),
                          ),

                          child: const Column(
                            children: [
                              GestureInfo(
                                icon: Icons.touch_app,
                                title: 'Single Tap',
                                description: 'Prints "Hello World!"',
                              ),

                              SizedBox(height: 12),

                              GestureInfo(
                                icon: Icons.ads_click,
                                title: 'Double Tap',
                                description:
                                    'Prints ITP107 course code and description',
                              ),

                              SizedBox(height: 12),

                              GestureInfo(
                                icon: Icons.pan_tool_alt,
                                title: 'Long Press',
                                description: 'Prints Cristina Villarosa',
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          'ITP107 • Mobile Application Development',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: mediumBrown),
                        ),
                      ],
                    ),
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

// =====================================================
// REUSABLE GESTURE INFORMATION WIDGET
// =====================================================

class GestureInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const GestureInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const darkBrown = Color(0xFF7A4314);
    const mediumBrown = Color(0xFF95612F);
    const lightTan = Color(0xFFEED8A6);

    return Row(
      children: [
        Container(
          width: 42,
          height: 42,

          decoration: BoxDecoration(
            color: lightTan,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(icon, size: 21, color: darkBrown),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkBrown,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                description,
                style: const TextStyle(fontSize: 12, color: mediumBrown),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
