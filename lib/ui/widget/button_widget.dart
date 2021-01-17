part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onClickState;

  ButtonWidget(this.text, this.color, this.onClickState);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          onClickState();
        },
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
