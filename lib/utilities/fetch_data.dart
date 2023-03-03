import 'package:http/http.dart' as http;

fetchData(url, Function function) async {
  var res;
  try {
    res = await http.get(Uri.parse(url));
  } on Exception {
    function(res, true);
    return;
  }
  function(res, false);
}
