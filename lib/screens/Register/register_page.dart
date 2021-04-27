import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_page.dart';
import 'package:plantmanager/screens/Login/login_page.dart';

class Register extends StatefulWidget {
  Register({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final _tedName = TextEditingController();
  final _tedPasswd = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  String name, username, email, password, confirmPassword;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 96),
          height: 100, 
          width: 100, 
          child: Image.asset(AppImages.logo)
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 50),
          child: Text("Crie seu cadastro", style: AppTextStyles.titleBold),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldName(),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldUsername(),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldEmail(),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldPassword(),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldConfirmPassword(),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 72),
          child: materialRegisterButton(),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 10),
          child: materialLoginButton(),
        ),
      ],
    );
  }

  String _validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validateUsername(String value) {
    String patttern = r'(^[a-z0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    
    if (value.length == 0) {
      return "Informe o nome de usuário";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou 0-9";
    }
    return null;
  }

  String _validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }
    return null;
  }

  String _validatePassword(String value) {
    if (value.length == 0) {
      return "Informe a Senha";
    }
    return null;
  }

  String _validateConfirmPassword(String value) {
    if (value.length == 0) {
      return "Informe a Senha";
    } else if (value != _tedPasswd.text) {
      return "As senhas não podem ser diferentes";
    }
    return null;
  }

  _sendForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(name: _tedName.text)));
    } else {
      // setState(() { _validate = true; });
    }
  }

  TextFormField textFormFieldName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: _tedName,
      validator: _validateName,
      onSaved: (String val) { name = val; },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o seu nome",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

  TextFormField textFormFieldUsername() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      validator: _validateUsername,
      onSaved: (String val) { name = val; },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o seu nome de usuário",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

  TextFormField textFormFieldEmail() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      validator: _validateEmail,
      onSaved: (String val) { email = val; },
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
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _tedPasswd,
      validator: _validatePassword,
      onSaved: (String val) { password = val; },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite sua senha", 
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0), 
      ),
    );
  }
  
  TextFormField textFormFieldConfirmPassword() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: _validateConfirmPassword,
      onSaved: (String val) { confirmPassword = val; },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Repita sua senha", 
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0), 
      ),
    );
  }

  Material materialRegisterButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(16),
      color: AppColors.greenColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Text("Confirmar", 
          style: GoogleFonts.roboto(
            color: AppColors.shapeColor, 
            fontSize: 17, 
            fontWeight: FontWeight.w500
          ), 
          textAlign: TextAlign.center
        ),
        onPressed: () { _sendForm(); },
      ),
    );
  }

  Material materialLoginButton() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(16),
      color: AppColors.greenLightColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Text("Voltar para o login", 
          style: GoogleFonts.roboto(
            color: AppColors.greenDarkColor, 
            fontSize: 17, 
            fontWeight: FontWeight.w500
          ), 
          textAlign: TextAlign.center
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        },
      ),
    );
  }
}