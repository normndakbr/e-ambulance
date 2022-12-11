import 'package:flutter/cupertino.dart';

class ButtonRiwayat extends StatelessWidget {
  const ButtonRiwayat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
          child: Container(
            child: Image.asset('assets/images/btnRiwayat.png'),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/riwayat');
          },
        ),
      ),
    );
  }
}
