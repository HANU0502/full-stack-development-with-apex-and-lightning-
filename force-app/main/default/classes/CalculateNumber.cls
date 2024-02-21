public with sharing class CalculateNumber {
    @AuraEnabled
    public static List<Integer> getResult(Integer firstNumber,Integer secondNumber){
        List<Integer> ls1 = new List<Integer>();
        ls1.add(firstNumber+secondNumber);
        ls1.add(firstNumber-secondNumber);
        ls1.add(firstNumber*secondNumber);
        ls1.add(firstNumber/secondNumber);
		system.debug(ls1);
        return ls1;
    }
}