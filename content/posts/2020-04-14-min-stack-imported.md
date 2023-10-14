---
author: "volyx"
title:  "Min Stack"
date: "2020-04-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

- push(x) -- Push element x onto stack.
- pop() -- Removes the element on top of the stack.
- top() -- Get the top element.
- getMin() -- Retrieve the minimum element in the stack.

```txt
Example:

MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```

```java

class MinStack {
    
    private LinkedList<Node> stack = new LinkedList<>();
    
        
    /*     value, min
    
           -3, -3 
            0, -2
           -2, -2  
    */
        
    /** initialize your data structure here. */
    public MinStack() {
        
    }
    
    public void push(int x) {
        Node node;
        if (stack.isEmpty()) {
            node = new Node(x, x);
        } else {
            int min = Math.min(x, stack.peekFirst().min);
            node = new Node(x, min);
        }
        
        stack.push(node);
        
        System.out.printf("val %d min %d\n", node.value, node.min);
        
        
    }
    
    public void pop() {
        Node pop = stack.pop();
       System.out.printf("pop val %d min %d\n", pop.value, pop.min);
      
    }
    
    public int top() {
        return stack.peekFirst().value;
    }
    
    public int getMin() {
        Node first = stack.peekFirst();
        System.out.printf("getMin val %d min %d\n", first.value, first.min);
        return first.min;
    }
    
    class Node {
        
        Node(int value, int min) {
            this.value= value;
            this.min = min;
        }
        int value;
        int min;
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = new MinStack();
 * obj.push(x);
 * obj.pop();
 * int param_3 = obj.top();
 * int param_4 = obj.getMin();
 */
```

 
