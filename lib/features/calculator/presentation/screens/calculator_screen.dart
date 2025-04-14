import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = ''; // What the user types
  String _result = '0'; // What we show on top

  void _onButtonPressed(String label) {
    setState(() {
      if (label == 'C') {
        _input = '';
        _result = '0';
      } else if (label == '=') {
        _calculateResult();
      } else {
        _input += label;
        _result = _input;
      }
    });
  }

void _calculateResult() {
    try {
      final finalInput = _input.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(finalInput);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      _result = eval.toString();
      _input = _result;
    } catch (e) {
      _result = 'Error';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Display area
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Buttons grid
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _buildButtonRow(['7', '8', '9', '÷']),
                  _buildButtonRow(['4', '5', '6', '×']),
                  _buildButtonRow(['1', '2', '3', '-']),
                  _buildButtonRow(['C', '0', '=', '+']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> labels) {
    return Expanded(
      child: Row(
        children: labels.map((label) => _buildButton(label)).toList(),
      ),
    );
  }

  Widget _buildButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[850],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
