import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(validateCreditCard(3997998718), false);
    expect(validateCreditCard(49927398716), true);
  });
  test("Test Case 2", (){
    expect(sumOfDigits(18), 9);
    expect(sumOfDigits(48), 12);
    expect(sumOfDigits(1), 1);
  });
}
