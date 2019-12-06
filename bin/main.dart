///  Is this a valid credit card number?
///  Are credit card numbers just a random combination of the digits from 0-9? NO!
//  Credit card numbers are a systematic combination of numbers that can satisfy
//  a single test. This test is created so that errors can be avoided while
//  typing in credit card numbers as well as detect counterfeit cards!
//
//  The algorithm is as follows:
//
//  - Reverse the order of the digits in the number.
//  - Take the first, third, ... and every other odd digit in the reversed digits
//  and sum them to form the partial sum s1
//  - Taking the second, fourth ... and every other even digit in the reversed digits:
//        - Multiply each digit by two and sum the digits if the answer is greater
//          than nine to form partial sums for the even digits
//        - Sum the partial sums of the even digits to form s2
//  - If s1 + s2 ends in zero then the original number is in the form of a valid
//  credit card number as verified by the Luhn test.
//  Example
/// Input : 49927398716
/// Output: 49927398716 passes the test

bool validateCreditCard(int number){
  List <int> oddList = [];
  List <int> evenList = [];

  List <String> listOfNumbers = number.toString().split("");
  List <String>reverseListOfNumbers = listOfNumbers.reversed.toList();
 
 
  for(int i = 0; i < reverseListOfNumbers.length; i++){
    int parse = int.parse(reverseListOfNumbers[i]);
    int doubleParse = parse * 2;
    if(i%2 == 0){
      
     oddList.add(parse);
    }
    else if(doubleParse> 9){
      evenList.add(sumOfDigits(doubleParse));
    }
    else{
      evenList.add(doubleParse);
    }
    
  }

  int sum1 = oddList.reduce((a,b)=> a+b);
  int sum2 = evenList.reduce((a,b)=> a + b);
  return (sum1 + sum2) % 10 == 0;
}

int sumOfDigits(int integer){
 List <String> numberList = integer.toString().split("").toList();
 int sum = 0;
 for (int i = 0; i < numberList.length; i++){
   sum = sum+int.parse(numberList[i]);
 }
 return sum;
}

main() {
  validateCreditCard(49927398716);
}
