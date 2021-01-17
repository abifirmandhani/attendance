part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return BlocListener<UserBloc, UserState>(
              listener: (context, state){
                if(state is UserError){
                  Flushbar(
                    backgroundColor: mainColor,
                    message: state.message.toString(),
                    duration: Duration(seconds: 4),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                  )..show(context);
                }else if(state is UserLoaded){
                  Navigator.pushReplacementNamed(context, HomeRoute);
                }else if(state is Userempty){
                  Flushbar(
                    backgroundColor: mainColor,
                    message: "Username atau password salah",
                    duration: Duration(seconds: 4),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                  )..show(context);
                }
              },
              child: Scaffold(
              body: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "ePrensensi",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 30),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Lakukan presensi dengan mudah dan cepat"),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Image.asset("assets/base.png"),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: cUsername,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Username",
                            hintText: "Username"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: cPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: "Password"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      state is UserLogin
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : ButtonWidget("Login", mainColor, () {
                              context.read<UserBloc>().add(
                                  LoginUser(cUsername.text, cPassword.text));
                            })
                    ],
                  ),
                ),
              ),
            ),
            );
          },
        );
  }
}
