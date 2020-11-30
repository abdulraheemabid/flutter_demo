import 'package:demo/drawer.dart';
import 'package:demo/models/device-params.dart';
import 'package:flutter/material.dart';

class Steppers extends StatefulWidget {
  @override
  _SteppersState createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  int currentStep = 0;
  bool complete = false;
  StepperType stepperType = StepperType.vertical;

  List<Step> steps = [
    Step(
      title: const Text('New Account'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.error,
      title: const Text('Avatar'),
      subtitle: const Text("Error!"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final DeviceParams deviceParams = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: !deviceParams.isSmallDevice
                  ? BoxDecoration(border: Border.all(color: Colors.red))
                  : null,
              width: deviceParams.containerWidth,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  complete
                      ? Center(
                          child: AlertDialog(
                            title: new Text("Profile Created"),
                            content: new Text(
                              "Tada!",
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  setState(() => complete = false);
                                },
                              ),
                            ],
                          ),
                        )
                      : Stepper(
                          type: stepperType,
                          steps: steps,
                          currentStep: currentStep,
                          onStepContinue: next,
                          onStepTapped: (step) => goTo(step),
                          onStepCancel: cancel,
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }
}
