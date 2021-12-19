import 'package:flutter/cupertino.dart';
import 'package:pet_log/auth/state/user_notifier.dart';
import 'package:pet_log/main/state/document_notifier.dart';
import 'package:pet_log/main/state/pet_notifier.dart';
import 'package:pet_log/main/state/photo_notifier.dart';
import 'package:provider/provider.dart';

class InjectionContainer extends StatefulWidget {
  final Widget? child;

  const InjectionContainer({
    Key? key,
    @required this.child,
  });

  @override
  _InjectionContainerState createState() => _InjectionContainerState();
}

class _InjectionContainerState extends State<InjectionContainer> {
  UserNotifier? _userNotifier;
  PetNotifier? _petNotifier;
  PhotoNotifier? _photoNotifier;
  DocumentNotifier? _documentNotifier;

  @override
  void initState() {
    super.initState();
    _initializeNotifiers();
    _createSubscriptions();
  }

  void _initializeNotifiers() {
    _userNotifier = UserNotifier();
    _petNotifier = PetNotifier();
    _photoNotifier = PhotoNotifier();
    _documentNotifier = DocumentNotifier();
  }

  void _createSubscriptions() {
    _userNotifier?.addListener(_userNotifierListener);
  }

  void _userNotifierListener() {}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>.value(value: _userNotifier!),
        ChangeNotifierProvider<PetNotifier>.value(value: _petNotifier!),
        ChangeNotifierProvider<PhotoNotifier>.value(value: _photoNotifier!),
        ChangeNotifierProvider<DocumentNotifier>.value(value: _documentNotifier!),
      ],
      child: widget.child,
    );
  }

  void _cancelSubscriptions() {
    _userNotifier?.removeListener(_userNotifierListener);
  }

  void _disposeNotifiers() {
    _userNotifier?.dispose();
  }

  @override
  void dispose() {
    _cancelSubscriptions();
    _disposeNotifiers();
    super.dispose();
  }
}
