import 'package:deliveryapp/widget/custom_action_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedTab extends StatelessWidget {
  const SavedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        children: [
          Center(
            child: Text("Saved Tab"),
          ),
          Container(
            child: CustomActionBar(
              title: "Saved",
              hasBackArrow: false,
            ),
          )
        ],
      ),
    );
  }
}
