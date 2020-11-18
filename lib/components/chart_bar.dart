import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar(this.label, this.value, this.percentage);

  String get _formatValue {
    if (value <= 1000) {
      return value.toStringAsFixed(2);
    } else if (value > 1000 && value < 10000) {
      return value.toString()[0] + "K";
    } else if (value >= 10000 && value < 100000) {
      return value.toString().substring(0, 2) + "K";
    } else if (value >= 100000 && value < 1000000) {
      return value.toString().substring(0, 3) + "K";
    } else {
      return value.toString()[0] + "M";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(_formatValue)
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 60, 
          width: 10, 
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
            ],
          )
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}