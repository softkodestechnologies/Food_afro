import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/provider/auth_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_divider.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const routeName = '/authSecreen';
  final Widget authDetails = const AuthDetailsScreen();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);

    ////////////////////////////////////////////////////////////////
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: media.height,
        child: desktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  authDetails,
                  SizedBox(
                    height: media.height,
                    width: media.width / 2,
                    child: Image.asset('assets/images/auth_pic.jpg',
                        fit: BoxFit.fill),
                  )
                ],
              )
            : authDetails,
      ),
    );
  }
}

////////////////////////// AUTH SCREEN //////////////////////
class AuthDetailsScreen extends StatefulWidget {
  const AuthDetailsScreen({super.key});

  @override
  State<AuthDetailsScreen> createState() => _AuthDetailsScreenState();
}

class _AuthDetailsScreenState extends State<AuthDetailsScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final textboxmainTextStyle = const TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  //
  @override
  void initState() {
    // TODO: implement initState

    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // bool _showPassword = false;

  void popUp(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,
            child: BodyText(
              text: text,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var authprovider = Provider.of<AuthProvider>(context);
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool signedIn = authprovider.signin;
    return Form(
      key: _formKey,
      child: Container(
        width: desktop ? media.width / 2 : media.width,
        padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: media.width * .04),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  top: media.height * .03,
                  bottom: media.height * .03,
                ),
                alignment: Alignment.center,
                height: 45,
                width: 200,
                color: AppColors.complementColor,
                child: SvgPicture.asset('assets/images/logo2.svg'),
              ),
            ),
            Text(
              signedIn ? 'Sign in here' : 'Sign up here',
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.complementColor),
            ),
            const SizedBox(height: 15),
            const SmallBodyText(
                size: 14,
                text: 'Lorem ipsum dolor sit amet consectetur.',
                color: Colors.grey),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SmallBodyText(
                    size: 14,
                    text: 'Lorem velit adipiscing ',
                    color: Colors.grey),
                InkWell(
                    onTap: () {
                      authprovider.signIn();
                    },
                    child: BodyText(
                      size: 14,
                      color: AppColors.complementColor,
                      text: signedIn ? 'Sign in' : 'Sign up',
                    ))
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              splashColor: AppColors.complementColor,
              child: Container(
                alignment: Alignment.center,
                width: desktop ? media.width * .8 : (media.width * .43) + 130,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  SvgPicture.asset('assets/images/google.svg'),
                  const SizedBox(width: 5),
                  BodyText(
                      text: signedIn
                          ? 'Sign in with Google'
                          : 'Sign up with Google')
                ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30, top: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppDivider(width: desktop ? 120 : media.width / 3),
                  const BodyText(text: '     or     '),
                  AppDivider(width: desktop ? 120 : media.width / 3),
                ],
              ),
            ),

            //////////////TEXT FIELDS///////////////
            SizedBox(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email address',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      // height: 45,
                      width: desktop
                          ? media.width * .8
                          : (media.width * .43) + 130,
                      child: TextFormField(
                        cursorHeight: 20,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            popUp(context, 'Please enter Email');
                            return 'Enter email';
                          } else {
                            return null;
                          }
                        },
                        controller: _email,
                        decoration: InputDecoration(
                            isDense: true,
                            hintStyle: textboxmainTextStyle,
                            hintText: 'Enter your email address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      // height: 45,
                      width: desktop
                          ? media.width * .8
                          : (media.width * .43) + 130,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            popUp(context, 'Please enter password');
                            return 'Enter password';
                          } else {
                            return null;
                          }
                        },
                        cursorHeight: 20,
                        controller: _password,
                        decoration: InputDecoration(
                            constraints: const BoxConstraints(
                                minHeight: 45, minWidth: 150),
                            hintStyle: textboxmainTextStyle,
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ),
                  ]),
            ),

            SizedBox(height: desktop ? 18 : 30),
            AppButton1(
              label: signedIn ? 'Continue' : 'Sign up',
              function: () {
                if (signedIn) {
                  if (_formKey.currentState!.validate()) {
                    authprovider.userAuth();
                    Navigator.pop(context);
                  }
                } else {
                  /////  sign up process
               
                }
              },
              width: desktop ? media.width * .8 : (media.width * .43) + 130,
            )
          ],
        ),
      ),
    );
  }
}
