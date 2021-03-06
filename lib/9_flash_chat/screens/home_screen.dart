import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nursultan_assigmants/9_flash_chat/screens/login_screen.dart';
import 'package:nursultan_assigmants/9_flash_chat/screens/register_screen.dart';
import 'package:nursultan_assigmants/9_flash_chat/widgets/custom_elevated_button.dart';
import 'package:nursultan_assigmants/app/custom_app_bar/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: CustomAppBar(
        'Chat',
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText(
                  '',
                  textStyle: TextStyle(
                    fontSize: 000000.0,
                  ),
                ),
                FlickerAnimatedText(
                  '',
                  textStyle: TextStyle(
                    fontSize: 0000000.0,
                  ),
                ),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/imagesflashchat/logo.png'),
                    height: 70.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 32.0,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            CustomElevatedButton(
              backgroundColor: Color(0xff41C3FF),
              buttonText: 'Login',
              screenRouteId: LoginScreen.id,
              horizontal: 130.0,
            ),
            const SizedBox(height: 25.0),
            CustomElevatedButton(
              backgroundColor: Color(0xff4489FF),
              buttonText: 'Register',
              screenRouteId: RegisterScreen.id,
            ),
          ],
        ),
      ),
    );
  }
}
