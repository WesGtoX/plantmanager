import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_page.dart';

class Login extends StatelessWidget {

  final _tedLogin = TextEditingController();
  final _tedPasswd = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body(context),
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String _validatePassword(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  bool _validateAuth(String login, String passwd) {
    var users = ['wesley.mendes@sou.unaerp.edu.br', 'quemuel.nassow@sou.unaerp.edu.br'];
    var userPasswd = ['unaerp@123'];

    var validateUser = users.any((el) => el == login);
    var validatePasswd = userPasswd.any((el) => el == passwd);

    if (validateUser && validatePasswd) {
      return true;
    }
    return false;
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 96),
            height: 36, 
            width: 36, 
            child: Image.asset("assets/images/emoji_login.png")
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 50),
            child: Text("Tela de Login", style: AppTextStyles.titleBold),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
            child: textFormFieldLogin(),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
            child: textFormFieldPassword(),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72),
            child: materialButton(context),
          ),
        ],
      )
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tedLogin.text;
    final passwd = _tedPasswd.text;

    if(!_formKey.currentState.validate()) {
      return;
    }

    if (_validateAuth(login, passwd)) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
    return;
  }

  TextFormField textFormFieldLogin() {
    return TextFormField(
      controller: _tedLogin,
      validator: _validateLogin,
      keyboardType: TextInputType.text,
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o seu e-mail",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

  TextFormField textFormFieldPassword() {
    return TextFormField(
      controller: _tedPasswd,
      validator: _validatePassword,
      obscureText: true,
      keyboardType: TextInputType.text,
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite sua senha",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

  Material materialButton(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(16),
      color: AppColors.greenColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Text("Entrar", 
          style: GoogleFonts.roboto(
            color: AppColors.shapeColor, 
            fontSize: 17, 
            fontWeight: FontWeight.w500
          ), 
          textAlign: TextAlign.center
        ),
        onPressed: () { _onClickLogin(context); },
      ),
    );
  }
}
