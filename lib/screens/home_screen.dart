import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:project_with_ai/screens/screamer_screen.dart';
import 'package:project_with_ai/widgets/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String calculations = "";

  void deleteOneChar() {
    setState(() {
      if (calculations.isNotEmpty) {
        calculations = calculations.substring(0, calculations.length - 1);
      }
    });
  }

  void signDoNotRepeat(String sign) {
    setState(() {
      if (calculations.endsWith("%") ||
          calculations.endsWith("/") ||
          calculations.endsWith("*") ||
          calculations.endsWith("-") ||
          calculations.endsWith("+") ||
          calculations.endsWith("=") ||
          calculations.endsWith(".")) {
        return;
      } else {
        if (calculations.isNotEmpty) {
          calculations = calculations + sign;
        }
      }
    });
  }

  void calculate() {
    setState(() {
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(calculations);
      double result = exp.evaluate(EvaluationType.REAL, ContextModel());
      calculations = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  child: Text(
                    calculations,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          //Another block
          const Divider(color: Color.fromARGB(255, 86, 86, 86)),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 1,
                ),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "";
                          });
                        },
                        child: Text(
                          "AC",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 1) {
                      return MyButton(
                        isEqual: false,
                        onPressed: deleteOneChar,
                        child: Icon(
                          Icons.backspace_outlined,
                          color: theme.colorScheme.primary,
                          size: 25,
                        ),
                      );
                    } else if (index == 2) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("%"),
                        child: Icon(
                          Icons.percent,
                          color: theme.colorScheme.primary,
                          size: 25,
                        ),
                      );
                    } else if (index == 3) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("/"),
                        child: Text(
                          "÷",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else if (index == 7) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("*"),
                        child: Text(
                          "×",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else if (index == 11) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("-"),
                        child: Icon(
                          Icons.remove,
                          color: theme.colorScheme.primary,
                          size: 25,
                        ),
                      );
                    } else if (index == 15) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("+"),
                        child: Icon(
                          Icons.add,
                          color: theme.colorScheme.primary,
                          size: 25,
                        ),
                      );
                    } else if (index == 19) {
                      return MyButton(
                        isEqual: true,
                        onPressed: calculate,
                        child: Text(
                          "=",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    } else if (index == 18) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () => signDoNotRepeat("."),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 4) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}7";
                          });
                        },
                        child: Text(
                          "7",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 5) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}8";
                          });
                        },
                        child: Text(
                          "8",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 6) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}9";
                          });
                        },
                        child: Text(
                          "9",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 8) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}4";
                          });
                        },
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 9) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}5";
                          });
                        },
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 10) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}6";
                          });
                        },
                        child: Text(
                          "6",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 12) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}1";
                          });
                        },
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 13) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}2";
                          });
                        },
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 14) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}3";
                          });
                        },
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (index == 16) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreamerScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.tag_faces_sharp,
                          size: 35,
                          color: theme.colorScheme.primary,
                        ),
                      );
                    } else if (index == 17) {
                      return MyButton(
                        isEqual: false,
                        onPressed: () {
                          setState(() {
                            calculations = "${calculations}0";
                          });
                        },
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: theme.colorScheme.inversePrimary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
