import 'dart:io';

import 'package:git_hooks/git_hooks.dart';
// import 'dart:io';

void main(List<String> arguments) {
  // ignore: omit_local_variable_types
  Map<Git, UserBackFun> params = {
    Git.commitMsg: commitMsg,
    Git.preCommit: preCommit
  };
  GitHooks.call(arguments, params);
}

Future<bool> commitMsg() async {
  const commitType = ['fix', 'feature', 'update', 'patch', 'refactor'];
  var commitMsg = Utils.getCommitEditMsg();

  if (commitMsg.isNotEmpty) {
    for (var item in commitType) {
      if (commitMsg.contains('$item:')) return true;
    }
  }

  print('you should add $commitType in the commit message');

  return false;
}

Future<bool> preCommit() async {
  try {
    ProcessResult result = await Process.run('flutter', ['test']);
    print(result.stdout);
    if (result.exitCode != 0) return false;
  } catch (e) {
    return false;
  }

  return true;
}
