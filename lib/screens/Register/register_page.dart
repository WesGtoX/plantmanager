import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Login/login_page.dart';

class Register extends StatefulWidget {
  Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final _tedName = TextEditingController();
  final _tedEmail = TextEditingController();
  final _tedPasswd = TextEditingController();
  final _tedCpf = TextEditingController();
  final _tedPhone = TextEditingController();
  // final _tedPhoto = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  late String name, email, passwd, cpf, phone, photo;
  
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
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldCpf(),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
          child: textFormFieldPhone(),
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

  _sendForm() {
    name = _tedName.text;
    email = _tedEmail.text;
    passwd = _tedPasswd.text;
    cpf = _tedCpf.text;
    phone = _tedPhone.text;
    // photo = _tedPhoto;

    if(!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    FirebaseAuth fa = FirebaseAuth.instance;

    fa.createUserWithEmailAndPassword(email: email, password: passwd)
      .then((result) {
        var db = FirebaseFirestore.instance;
        
        db.collection('users').doc(result.user!.uid).set({
            'name' : name,
            'email': email,
            'cpf': cpf,
            'phone': phone,
            // 'photo': photo,
          }
        ).then((result) {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Cadastro Realizado'),
                content: Text('Usuário criado com sucesso!'),
                actions: [
                  TextButton(
                    child: Text('FAZER LOGIN'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                  )
                ],
              );
            }
          );
        });
    }).catchError((error) {
      var errorCode = error.code;
      var message = '';

      if (errorCode == 'email-already-in-use') {
        message = 'Oops, aconteceu alguma coisa ao tentar cadastrar o usuário';
      } else {
        message = error.message;
      }

      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cadastro Inválido'),
            content: Text('$message'),
            actions: [
              TextButton(
                child: Text('TENTAR NOVAMENTE'),
                onPressed: () { Navigator.of(context).pop(); }, 
              )
            ],
          );
        }
      );
    });
  }

  TextFormField textFormFieldName() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: _tedName,
      validator: (String? value) {
        String patttern = r'(^[a-zA-Z ]*$)';
        RegExp regExp = new RegExp(patttern);
        
        if (value == null || value.length == 0) {
          return "Informe o nome";
        } else if (!regExp.hasMatch(value)) {
          return "O nome deve conter caracteres de a-z ou A-Z";
        }
        return null;
      },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o seu nome",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

  TextFormField textFormFieldEmail() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: _tedEmail,
      validator: (String? value) {
        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = new RegExp(pattern);
        
        if (value == null || value.length == 0) {
          return "Informe o Email";
        } else if(!regExp.hasMatch(value)){
          return "Email inválido";
        }
        return null;
      },
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
      validator: (String? value) {
        if (value == null || value.length == 0) {
          return "Informe a Senha";
        }
        return null;
      },
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
      validator: (String? value) {
        if (value == null || value.length == 0) {
          return "Informe a Senha";
        } else if (value != _tedPasswd.text) {
          return "As senhas não podem ser diferentes";
        }
        return null;
      },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Repita sua senha", 
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0), 
      ),
    );
  }

    TextFormField textFormFieldCpf() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter(),
      ],
      obscureText: false,
      keyboardType: TextInputType.number,
      maxLength: 14,
      controller: _tedCpf,
      validator: (String? value) {
        String patttern = r'([0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2})';
        RegExp regExp = new RegExp(patttern);
        
        if (value == null || value.length == 0) {
          return "Informe o CPF";
        } else if (!regExp.hasMatch(value)) {
          return "O CPF deve ser no formato correto: XXX.XXX.XXX-XX";
        }
        return null;
      },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o número do seu CPF",
        labelStyle: GoogleFonts.roboto(color: AppColors.bodyColor),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      ),
    );
  }

    TextFormField textFormFieldPhone() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      obscureText: false,
      keyboardType: TextInputType.phone,
      maxLength: 15,
      controller: _tedPhone,
      validator: (String? value) {
        String patttern = r'(\([1-9]{2}\) [9]{0,1}[6-9]{1}[0-9]{3}\-[0-9]{4}$)';
        RegExp regExp = new RegExp(patttern);
        
        if (value == null || value.length == 0) {
          return "Informe o número de telefone";
        } else if (!regExp.hasMatch(value)) {
          return "O telefone deve ser no formato correto: (XX) 9XXXX-XXXX";
        }
        return null;
      },
      style: AppTextStyles.text,
      decoration: InputDecoration(
        labelText: "Digite o número do seu telefone",
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
