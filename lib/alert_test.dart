import 'package:flutter/material.dart';

class AlertTest extends StatefulWidget {
  const AlertTest({Key? key}) : super(key: key);

  @override
  State<AlertTest> createState() => _AlertTestState();
}

class _AlertTestState extends State<AlertTest> {
  final _valueList = ['아무도 그딴 이유로 쉬지 않는다!', '진실을 말해라!', '아픔', '재고소진', '일하기싫음', '기타'];
  var _selectedValue = '아픔';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, setState) => AlertDialog(
                  titlePadding: EdgeInsets.only(left: 100, right: 100, top: 30),
                  title: Text(
                    '영업중지 할거임?',
                    textAlign: TextAlign.center,
                  ),
                  content: DropdownButton(
                    isExpanded: true,
                    value: _selectedValue,
                    items: _valueList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          _selectedValue = value as String;
                          print(_selectedValue);
                        },
                      );
                    },
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('네'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('아니오'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blueAccent,
            ),
            height: 40,
            width: 200,
            child: Center(
              child: Text(
                'Alert',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
