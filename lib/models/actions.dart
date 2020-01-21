import 'package:github_desktop_flutter/models/profile.dart';
import 'package:meta/meta.dart';
import 'package:github_desktop_flutter/models/problem.dart';

class Action {
  const Action(this.propsMap);
  Action.fromJson(Map<String, dynamic> json) : propsMap = json;
  final Map<String, dynamic> propsMap;
  Map<String, dynamic> toJson() => propsMap;

  factory Action.ObserveAuthState() => ObserveAuthState();
  factory Action.SigninWithGoogle() => SigninWithGoogle();
  factory Action.StoreAuthStep({@required int step}) =>
      StoreAuthStep(step: step);
  factory Action.AddProblem({@required Problem problem}) =>
      AddProblem(problem: problem);
  factory Action.RetrieveProfile() => RetrieveProfile();
  factory Action.StoreAuthToken({@required String token}) =>
      StoreAuthToken(token: token);
  factory Action.StoreProfile({@required Profile profile}) =>
      StoreProfile(profile: profile);
  factory Action.LaunchAuthPage() => LaunchAuthPage();
}

class ObserveAuthState extends Action {
  const ObserveAuthState() : super(const <String, Object>{});
}

class SigninWithGoogle extends Action {
  SigninWithGoogle() : super(<String, Object>{});
}

class StoreAuthStep extends Action {
  StoreAuthStep({@required this.step}) : super(<String, Object>{'step': step});
  final int step;
}

class AddProblem extends Action {
  AddProblem({@required this.problem})
      : super(<String, Object>{'problem': problem});
  final Problem problem;
}

class RetrieveProfile extends Action {
  RetrieveProfile() : super(<String, Object>{});
}

class StoreAuthToken extends Action {
  StoreAuthToken({@required this.token})
      : super(<String, Object>{'token': token});
  final String token;
}

class StoreProfile extends Action {
  StoreProfile({@required this.profile})
      : super(<String, Object>{'profile': profile});
  final Profile profile;
}

class LaunchAuthPage extends Action {
  LaunchAuthPage() : super(<String, Object>{});
}
