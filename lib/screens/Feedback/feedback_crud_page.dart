import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/screens/Home/home_list_plants.dart';

class FeedbackWidget extends StatefulWidget {
  final String userId;
  final String userName;

  const FeedbackWidget({Key? key, required this.userId, required this.userName})
      : super(
          key: key,
        );

  @override
  _FeedbackWidgetState createState() =>
      _FeedbackWidgetState(this.userId, this.userName);
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  late String userId;
  late String userName;

  _FeedbackWidgetState(this.userId, this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(AppImages.emojiHug),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text("Tudo certo", style: AppTextStyles.titleSemiBold, textAlign: TextAlign.center),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Fique tranquilo que sempre vamos lembrar você de cuidar da sua plantinha com bastante amor.",
                      style: AppTextStyles.text, textAlign: TextAlign.center
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 93, vertical: 16),
                  margin: EdgeInsets.only(bottom: 39),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: TextButton(
                    child: Text("Muito obrigado :D", style: GoogleFonts.roboto(
                          color: AppColors.shapeColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListPlants( userId: this.userId, userName: this.userName)));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
