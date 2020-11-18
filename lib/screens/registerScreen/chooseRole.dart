import 'package:flutter/material.dart';
import 'package:flutter_tutofast/constants/app_colors.dart';
class RegisterChooseRole extends StatelessWidget {
  final Function onPressed;

  const RegisterChooseRole({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController(
      initialPage: 0,
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: (){
              _controller.jumpToPage(0);
            },
            child: Icon(Icons.chevron_left, color: AppColors.blue),
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          Container(
            width: 100,
            height: 130,
            child: PageView(
              controller: _controller,
              onPageChanged: onPressed,
              children: [
                Column(children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/user-student.jpg')
                      )
                    )
                  ),
                  SizedBox(height: 10),
                  Text('Student',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ]),
                Column(children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/user-teacher.jpg')
                      )
                    )
                  ),
                  SizedBox(height: 10),
                  Text('Teacher',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ]),
              ],
            )
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: (){
              _controller.jumpToPage(1);
            },
            child: Icon(Icons.chevron_right, color: AppColors.blue),
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
        ]
      )
    );
  }
}