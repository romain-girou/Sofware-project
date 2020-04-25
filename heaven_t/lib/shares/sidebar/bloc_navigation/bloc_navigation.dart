import 'package:bloc/bloc.dart';
import 'package:heavent/screens/event/event.dart';
import 'package:heavent/screens/home/home.dart';
import 'package:heavent/screens/profile/profile.dart';
import 'package:heavent/screens/settings/settings.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  EventPageClickedEvent,
  ProfilePageClickedEvent,
  SettingPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.EventPageClickedEvent:
        yield EventPage();
        break;
      case NavigationEvents.ProfilePageClickedEvent:
        yield ProfilePage();
        break;
      case NavigationEvents.SettingPageClickedEvent:
        yield SettingPage();
        break;
    }
  }
}