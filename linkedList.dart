class Node<T> {
  T? value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
  
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E? value) {
    // Pushing to the Front of a List

    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    // Appending to the End of a List

    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value); // null assertion operator

    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {

    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }
  Node<E> insertAfter(Node<E> node, E value) {
    // Inserting in Middle of a List

    if (tail == node) {
      append(value);
      return tail!;
    }

    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    // Popping From the Front of a List

    final value = head?.value; // null-aware operator
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    // Removing From the End of a List

    if (head?.next == null) return pop();

    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    // Removing a Value From the Middle of a List

    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  void reverse(){
    Node<E>? prev = null;
    Node<E>? curr = head;
    while(curr != null){
      final next_node = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next_node;
    }
    head = prev;

  }

  void removeAllOccurrences(E x){
    Node<E>? node = head;
    while(node != null){
      while(node.next?.value == x){
        removeAfter(node);
      }
      node = node.next;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

 
}
void printInReverse<E>(LinkedList<E> list){
  LinkedList<E> temp = LinkedList();
  
  while(!list.isEmpty){
    temp.push(list.pop());
  }
  while(!temp.isEmpty){
    print(temp.head?.value);
    list.push(temp.pop());
  }
}

E? returnMiddle<E>(LinkedList<E> list){
  double cnt = 0;
  Node<E>? h = list.head;
  while(h?.next != null){
    h = h?.next;
    cnt ++;
  }
  cnt /= 2;
  return list.nodeAt(cnt.round())?.value;
}
void main(){
  // final node1 = Node(value: 1);
  // final node2 = Node(value: 2);
  // final node3 = Node(value: 3);

  // node1.next = node2;
  // node2.next = node3;

  // print(node1);
  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // print(list);
  
  // final list = LinkedList<int>();
  // list.append(1);
  // list.append(2);
  // list.append(3);

  // print(list);

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // print('Before: $list');

  // var middleNode = list.nodeAt(1)!;
  // list.insertAfter(middleNode, 42);
 
  // print('After:  $list');

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // print('Before: $list');

  // final poppedValue = list.pop();

  // print('After:  $list');
  // print('Popped value: $poppedValue');

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // print('Before: $list');

  // final removedValue = list.removeLast();

  // print('After:  $list');
  // print('Removed value: $removedValue');

  // final list = LinkedList<int>();
  // list.push(3);
  // list.push(2);
  // list.push(1);

  // print('Before: $list');

  // final firstNode = list.nodeAt(0);
  // final removedValue = list.removeAfter(firstNode!);
  // printInReverse(list);
  // print('After:  $list');
  // print('Removed value: $removedValue');

  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  printInReverse(list);
  print('After:  $list');

  final list1 = LinkedList<int>();
  list1.push(4);
  list1.push(3);
  list1.push(2);
  list1.push(1);

  print('list: $list1');
  print('middle : ${returnMiddle(list1)}');

  final list2 = LinkedList<int>();
  list2.push(3);
  list2.push(2);
  list2.push(1);

  print('list: $list2');
  print('middle : ${returnMiddle(list2)}');

  final list3 = LinkedList<int>();
  list3.push(3);
  list3.push(2);
  list3.push(1);

  print('Before: $list3');
  list3.reverse();
  print('After:  $list3');

  final list4 = LinkedList<int>();
  list4.push(2);
  list4.push(3);
  list4.push(3);
  list4.push(3);
  list4.push(1);

  print('Before: $list4');
  list4.removeAllOccurrences(3);
  print('After:  $list4');
}