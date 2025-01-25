import 'dart:io';

class Stack<E> {
  Stack() : _storage = <E>[];
  final List<E> _storage;
  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E get peek => _storage.last; 

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

}
bool balanceParentheses(String text){
  bool flag = true;
  Stack<String> parentheses = Stack();
  for(int i = 0;i < text.length;i++){
    if(text[i] == '('){
      flag = false;
      parentheses.push('(');
      continue;
    }
    else if(text[i] == ')'){
      if(parentheses.peek == '('){
        parentheses.pop();
        continue;
      }
      else{
        return false;
      }
    }
  }
  if(flag){
    return false;
  }
  if(parentheses.isNotEmpty){
    return false;
  }
  return true;
}
void printInReverse<E>(Stack<E> stack){

  Stack<E> temp = Stack();
  while(stack.isNotEmpty){
    temp.push(stack.pop());
  }
  while(temp.isNotEmpty){
    print(temp.peek);
    stack.push(temp.pop());
  }
}
void main(){
  print('Enter a text: ');
  String? input = stdin.readLineSync();
  //the parameter is in type String
  if(balanceParentheses(input ?? '')){ // to cast from String? to String to pass it the function
    print('balanced parentheses');
  }
  else{
    print('unbalanced parentheses or no parentheses');
  }
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print('-----');

  print(stack);
  printInReverse(stack);
  print(stack);

  final element = stack.pop();
  print('Popped: $element');

  const list = ['S', 'M', 'O', 'K', 'E'];
  final smokeStack = Stack.of(list);
  print(smokeStack);
  smokeStack.pop();

}
