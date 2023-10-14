---
author: "volyx"
title:  "Wine Selling Problem"
date: "2021-07-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[Wine Selling Problem](https://medium.com/trick-the-interviwer/wine-selling-problem-4f6886d8ed6d)

Problem statement:
Given n wines in a row, with integers denoting the cost of each wine respectively. Each year you can sell the first or the last wine in the row. Let the initial profits from the wines be P1, P2, P3…Pn. In the Yth year, the profit from the ith wine will be Y*P[i]. The goal is to calculate the maximum profit that can be earned by selling all the wines.

Suppose, wine array denotes the initial cost of each wine in the first year.

wine[] = [2, 4, 6, 2, 5]

The initial thought would be to go greedy, that is, check both the ends and sell the cheaper wine every time. If we do it greedy way,

```txt
    price = 2*1 = 2, remaining wines = [ 4, 6, 2, 5 ], Profit = 2
    price = 4*2 = 8, remaining wines = [ 6, 2, 5 ], Profit = 10
    price = 5*3 = 15, remaining wines = [ 6, 2 ], Profit = 25
    price = 2*4 = 8, remaining wines = [ 6 ], Profit = 33
    price = 6*5 = 30, remaining wines = [ ], Profit = 63
```

Therefore the overall profit received by applying a greedy approach is 63. Do you think this is the correct answer? Well, no! In a greedy approach, we select the best solution at each step. The greedy solution does not guarantee a globally optimal solution. Hence, by choosing the cheaper wine from each end every time, we might be the profit associated with the remaining unsold wines.

To the above solution, the actual optimal profit is 64. Let me show how:

wine[] = [2, 4, 6, 2, 5]

```txt
    price = 2*1 = 2, remaining wines = [ 4, 6, 2, 5 ], Profit = 2
    price = 5*2 = 10, remaining wines = [ 4, 6, 2 ], Profit = 12
    price = 2*3 = 6, remaining wines = [ 4, 6], Profit = 18
    price = 4*4 = 16, remaining wines = [ 6 ], Profit = 34
    price = 6*5 = 30, remaining wines = [ ], Profit = 64
```

So, here we can see, in the second step, wine with price 5 is sold first instead of the wine with the price 4. By doing this, we make sure that wine with a very cheap price that is ‘2’ is sold in the third year, which otherwise would have been sold in the fourth year. Hence, increasing the overall profit.

![ex1](/images/2021-07-04-ex1.jpeg)

## Solution

```java

import java.util.Arrays;

public class Main {
  int[] wines;
  int[][] winesProfit;
  
  public static void main(String[] args) {
    int[] wines = new int[] {2, 4, 6, 2, 5};
    int n = wines.length;
    var main = new Main();

    main.wines = wines;
    main.winesProfit = new int[n][n];

    System.out.println(main.maxProfit(1, 0, n - 1));
  }

  int maxProfit(int year, int left, int right) {

      if (left > right) return 0;
      else if (winesProfit[left][right] !=0) {
        return winesProfit[left][right];
      } else {
        int leftProfit = wines[left] * year 
           + maxProfit(year + 1, left + 1, right);

        int rightProfit = wines[right]  * year 
        + maxProfit(year + 1, left, right - 1);

        winesProfit[left][right] = Math.max(leftProfit, rightProfit);

        return winesProfit[left][right] ;
      }
  }

  int maxProfit2(int year, int left, int right) {
    
      if (left == right) return year * wines[left];

      int leftProfit = wines[left] * year 
        + maxProfit(year + 1, left + 1, right);

      int rightProfit = wines[right]  * year 
        + maxProfit(year + 1, left, right - 1);

      return Math.max(leftProfit, rightProfit);
  }
}

```
