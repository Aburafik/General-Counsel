import 'package:general_counsel/Utils/exports.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
          const Text("Register",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titlePlaceHolder("Name *"),
                const CustomTextField(),
                titlePlaceHolder("Email *"),
                const CustomTextField(),
                titlePlaceHolder("Password *"),
                const CustomTextField(
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(
                  height: AppDimentions.paddingExtraLarge,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CommonButton(
                    backgroundColor: ColorTheme.primaryColor,
                    title: "Register",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: AppDimentions.paddingSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?   ",
                      style: TextStyle(fontFamily: "Cairo"),
                    ),
                    GestureDetector(
                      onTap: () => context.goNamed("signIn"),
                      child: const Text(
                        "Login",
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
