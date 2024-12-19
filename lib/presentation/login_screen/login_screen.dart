import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: const LoginScreen(),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Center(
                    child: Image.asset(
                      ImageConstant.imgFyreboxLogo,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Center(
                    child: Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email Input
                        Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.userNameController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Color.fromARGB(255, 252, 205, 204),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 16.0,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (!isValidEmail(value, isRequired: true)) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Password Input
                        Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            return TextFormField(
                              controller: provider.passwordController,
                              obscureText: provider.isShowPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 252, 205, 204),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 16.0,
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(provider.isShowPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: provider.changePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password cannot be empty";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Sign In Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<LoginProvider>(context, listen: false)
                                  .callLoginDeviceAuth(
                                onSuccess: () {
                                  NavigatorService.pushNamed(
                                    AppRoutes.rootScreen,
                                  );
                                },
                                onError: () {
                                  // Handle login error
                                  print("Login failed");
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                const Color.fromARGB(255, 241, 46, 43),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(150, 58),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign In"),
                        ),
                        const SizedBox(height: 16.0),

                        // Forgot Password
                        // TextButton(
                        //   onPressed: () {
                        //     // Navigate to Forgot Password Screen
                        //   },
                        //   child: Text(
                        //     'Forgot Password?',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium!
                        //         .copyWith(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge!
                        //               .color!
                        //               .withOpacity(0.64),
                        //         ),
                        //   ),
                        // ),

                        // Sign Up Link
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.signUpScreen,
                            );
                          },
                          child: Text.rich(
                            const TextSpan(
                              text: "Don’t have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.64),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
