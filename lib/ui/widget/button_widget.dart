part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onClickState;

  ButtonWidget(this.text, this.color, this.onClickState);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: InkWell(
        onTap: () {
          onClickState();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
