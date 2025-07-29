import 'currencies.dart';
import 'currency.dart';

class CurrencyService {
  final List<Currency> _currencies;
  final Map<String, Currency> _byCode;

  CurrencyService()
      : _currencies = currencies
            .map((currency) => Currency.from(json: currency))
            .toList(),
        _byCode = {
          for (var json in currencies)
            json['code'].toString().toUpperCase(): Currency.from(json: json)
        };

  /// Return list with all currencies
  List<Currency> getAll() => _currencies;

  /// Returns the currency that matches the given code.
  Currency? findByCode(String? code) => _byCode[code?.toUpperCase()];

  /// Returns a list of currencies matching the given codes list.
  List<Currency> findCurrenciesByCode(List<String> codes) {
    return codes.map((code) => findByCode(code)).nonNulls.toList();
  }
}
