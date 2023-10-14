---
author: "volyx"
title:  "901. Online Stock Span"
date: "2021-08-19"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "monotonic-stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[901. Online Stock Span](https://leetcode.com/problems/online-stock-span/)

Design an algorithm that collects daily price quotes for some stock and returns the span of that stock's price for the current day.

The span of the stock's price today is defined as the maximum number of consecutive days (starting from today and going backward) for which the stock price was less than or equal to today's price.

- For example, if the price of a stock over the next 7 days were [100,80,60,70,60,75,85], then the stock spans would be [1,1,1,2,1,4,6].

Implement the StockSpanner class:

- StockSpanner() Initializes the object of the class.
- int next(int price) Returns the span of the stock's price given that today's price is price.

```txt
Example 1:

Input
["StockSpanner", "next", "next", "next", "next", "next", "next", "next"]
[[], [100], [80], [60], [70], [60], [75], [85]]
Output
[null, 1, 1, 1, 2, 1, 4, 6]

Explanation
StockSpanner stockSpanner = new StockSpanner();
stockSpanner.next(100); // return 1
stockSpanner.next(80);  // return 1
stockSpanner.next(60);  // return 1
stockSpanner.next(70);  // return 2
stockSpanner.next(60);  // return 1
stockSpanner.next(75);  // return 4, because the last 4 prices (including today's price of 75) were less than or equal to today's price.
stockSpanner.next(85);  // return 6
```

Constraints:

- 1 <= price <= 10^5
- At most 104 calls will be made to next.

## Solution

```java
class StockSpanner {
    
    // decresaing stack
    Stack<Integer> priceStack = new Stack<>(); 
    Stack<Integer> spanStack = new Stack<>();
    
    
    /*
    
    100 80  (60)  70  60  75
    
    1   1   (1)    2   1
    
    */

    public StockSpanner() {
        
    }
    
    public int next(int price) {
        
        int span = 1;
        while (priceStack.size() > 0 && priceStack.peek() <= price) {
            int prevPrice = priceStack.pop();
            int prevSpan = spanStack.pop();
            span += prevSpan;
        }
        
        priceStack.push(price);
        spanStack.push(span);
        
        return span;
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * StockSpanner obj = new StockSpanner();
 * int param_1 = obj.next(price);
 */
```
