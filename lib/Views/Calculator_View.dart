import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorViews extends StatefulWidget {
  const CalculatorViews({super.key});
  @override
  State<CalculatorViews> createState() => _CalculatorViewsState();
}

class _CalculatorViewsState extends State<CalculatorViews> {
  late final AppLifecycleListener listener;
  int x = 0;
  int y = 0;
  num z = 0;
  final DisplayOneController = TextEditingController();
  final DisplayTwoController = TextEditingController();
  @override
  void initState() {
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();
    listener = AppLifecycleListener(
      onShow: _onshow,
      onHide: _onhide,
      onDetach: _ondetach,
      onInactive: _oninactivated,
      onPause: _onPause,
      onRestart: _onrestart,
      onStateChange: _onstatechange,
    );
  }

  void _onshow() => print("onShow called");
  void _onhide() => print("onHide callled");
  void _ondetach() => print("onDetach called");
  void _oninactivated() => print("onInactivated called");
  void _onPause() => print("onPause called");
  void _onrestart() => print("onRestart called");
  void _onstatechange(AppLifecycleState state) {
    print("onStateChanged called with state: $state");
  }

  @override
  void dispose() {
    DisplayOneController.dispose();
    DisplayTwoController.dispose();
    listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        //Calculator Display
        children: [
          CalculatorDisplay(
            key: const Key("DisplayOne"),
              hint: "Enter first number", controller: DisplayOneController),
          SizedBox(height: 30),
          CalculatorDisplay(
            key: Key("DisplayTwo"),
              hint: "Enter second number", controller: DisplayTwoController),
          SizedBox(height: 30),
          Text(
            key:Key("Result"),
            z.toString(),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! +
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! -
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! *
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! /
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
              });
            },
            label: Text("clear"),
          )
        ],
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number", required this.controller});
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        autofocus: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 5.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 5.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ));
  }
}
