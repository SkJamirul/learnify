import 'package:flutter/material.dart';
import 'package:learnify/seconde_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> countryCodes = ['+1', '+44', '+91', '+81'];
  String selectedCountryCode = '+91';

  final TextEditingController _numController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Clear the phone number input when navigating back from OtpScreen
    _numController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/image.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                    color: Colors.purple[50]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    DropdownButton<String>(
                      value: selectedCountryCode,
                      underline: Container(color: Colors.transparent),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      alignment: Alignment.center,
                      dropdownColor: Colors.purple[50],
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
                      items: countryCodes.map((code) {
                        return DropdownMenuItem<String>(
                          value: code,
                          child: Text(code),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _numController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Phone Number",
                          hintStyle: const TextStyle(
                            color: Colors.black12,
                          ),
                          filled: true,
                          fillColor: Colors.purple[50],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtpScreen(
                              countrycode: selectedCountryCode,
                              phoneNumber: _numController.text,
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 192, 48, 217),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Expanded(
              child: Text(
                "By signing up, you're harmonizing with our \n Terms and Conditions",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numController.dispose();
    super.dispose();
  }
}
