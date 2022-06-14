

import 'local_src.dart';

class DemoLocalSrcImpl extends DemoLocalSrc{
  @override
  Future<String> doSomething()async {
    return "doSomethingSuccess";
  }

}