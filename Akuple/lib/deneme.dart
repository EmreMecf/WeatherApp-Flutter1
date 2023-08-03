import 'package:http/http.dart' as http;

void fetchData() async {
  var url = Uri.parse('https://www.ekertest.com');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = response.body;
    print('İstek Başarılı : ${response.statusCode}');
    // Verileri kullanın veya Cloudflare Repo'ya yükleyin.
  } else {
    print('İstek başarısız oldu. Hata kodu: ${response.statusCode}');
  }
}
