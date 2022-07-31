import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String exp = '';
  String history = '';
  double num1 = 0;
  double num2 = 0;
  String ope = '';
  List<String> his = [];
  String storedValue = '';
  int ifPress = 0;

  buttonPressed(String buttonValue) {
    if (buttonValue == 'C') {
      setState(() {
        exp = '';
        history = '';
      });
      num1 = 0;
      num2 = 0;
    } else if (buttonValue == '÷' ||
        buttonValue == '×' ||
        buttonValue == '-' ||
        buttonValue == '+') {
      ope = buttonValue;
      num1 = double.parse(exp);
      setState(() {
        exp = '';
        history = num1.toString();
        history += buttonValue;
      });
    } else if (buttonValue == '( )') {
      setState(() {
        exp += '(';
      });
    } else if (buttonValue == '+/-') {
      if (exp.toString().contains('-')) {
        exp.toString().substring(1);
        history = exp;
      } else {
        exp = '-$exp';
        history = exp;
      }
    } else if (buttonValue == '.') {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += buttonValue;
        });
      }
    } else if (buttonValue == '=') {
      num2 = double.parse(exp);
      history += exp;
      storedValue += history;
      history = '';
      switch (ope) {
        case '+':
          {
            exp = (num1 + num2).toString();
          }
          break;
        case '-':
          {
            exp = (num1 - num2).toString();
          }
          break;
        case '×':
          {
            exp = (num1 * num2).toString();
          }
          break;
        case '%':
          {
            exp = (num2/100).toString();
          }
          break;
        case '÷':
          {
            num2 == 0
                ? exp = 'Can’t divide by zero'
                : exp = (num1 / num2).toString();
          }
          break;
      }
      setState(() {
        his.add(storedValue);
        String secondValue = '=$exp';
        his.add(secondValue);
        storedValue = '';
      });
    } else {
      setState(() {
        exp += buttonValue;
      });
    }
  }

  Widget buttonForm(
    String textButton,
    Color textColor,
    Color backgroundButton,
  ) {
    return RawMaterialButton(
      onPressed: () {
        buttonPressed(textButton);
      },
      shape: const CircleBorder(),
      fillColor: backgroundButton,
      padding: const EdgeInsets.all(15),
      child: Text(
        textButton,
        style: TextStyle(
          fontSize: 26,
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: his.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        his[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      if (index % 2 == 1) const Divider(
                        thickness: 0.9,
                        color: Color(0xFF616161),
                      ),
                    ],
                  );
                }),
          )),
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 260,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white60,
                    ),
                  ),
                  Text(
                    exp,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 0.9,
            color: Color(0xFF616161),
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonForm(
                  'C',
                  Colors.redAccent,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '( )',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '%',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '÷',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonForm(
                  '7',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '8',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '9',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '×',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonForm(
                  '4',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '5',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '6',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '-',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonForm(
                  '1',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '2',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '3',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '+',
                  const Color(0xFFBF8B67),
                  const Color(0xFF212121),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonForm(
                  '+/-',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '0',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '.',
                  Colors.white,
                  const Color(0xFF212121),
                ),
                buttonForm(
                  '=',
                  const Color(0xFF212121),
                  const Color(0xFF9E9E9E),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
