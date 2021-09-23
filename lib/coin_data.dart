import 'networking.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '';

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCurrencyRate(String selectedCurrency) async {
    Map<String, String> rates = {};
    NetworkHelper? networkHelper;
    for (String crypto in cryptoList) {
      networkHelper =
          NetworkHelper('$url/$crypto/$selectedCurrency?apikey=$apiKey');
      var decodedData = await networkHelper.getData();
      print(decodedData);
      double rateInDouble = decodedData['rate'];
      rates[crypto] = rateInDouble.toStringAsFixed(0);
    }
    return rates;
  }
}
