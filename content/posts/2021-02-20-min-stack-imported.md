---
author: "volyx"
title:  "155. Min Stack"
date: "2021-02-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/min-stack/]

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

- push(x) -- Push element x onto stack.
- pop() -- Removes the element on top of the stack.
- top() -- Get the top element.
- getMin() -- Retrieve the minimum element in the stack.

```txt
Example 1:

Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
```

Constraints:

- Methods pop, top and getMin operations will always be called on non-empty stacks.

```java
class MinStack {
    
    private List<Integer> stack = new ArrayList<>();
    private List<Integer> min = new ArrayList<>();

    /** initialize your data structure here. */
    public MinStack() {
        
    }
    
    public void push(int x) {
        stack.add(x);
        int prev = min.size() > 0 ? min.get(min.size() - 1): Integer.MAX_VALUE;
        min.add(Math.min(prev, x));
    }
    
    public void pop() {
        stack.remove(stack.size() - 1);
        min.remove(min.size() - 1);
    }
    
    public int top() {
        return stack.get(stack.size() - 1);
    }
    
    public int getMin() {
        return min.get(min.size() - 1);
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
