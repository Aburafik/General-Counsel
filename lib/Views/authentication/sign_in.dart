import 'package:general_counsel/Utils/exports.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: ImageClipper(),
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetImages.logo,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: linearGradient,
                ),
              ),
            ),
          ),
          const Text("SignIn",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titlePlaceHolder("Email *"),
                const CustomTextField(),
                titlePlaceHolder("Password *"),
                const CustomTextField(
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(
                  height: AppDimentions.paddingSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(fontFamily: "Cairo"),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "  Reset",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            color: ColorTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimentions.paddingExtraLarge,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CommonButton(
                    backgroundColor: ColorTheme.primaryColor,
                    title: "Login",
                    onPressed: ()=>context.goNamed("dashboard"),
                  ),
                ),
                SizedBox(
                  height: AppDimentions.paddingSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?   ",
                      style: TextStyle(fontFamily: "Cairo"),
                    ),
                    GestureDetector(
                      onTap: ()=>context.goNamed("register"),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            color: ColorTheme.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
