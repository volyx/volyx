---
author: "volyx"
title:  "282. Expression Add Operators"
date: "2021-11-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "fb", "backtracking", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![282. Expression Add Operators](https://leetcode.com/problems/expression-add-operators/)

Given a string num that contains only digits and an integer target, return all possibilities to insert the binary operators '+', '-', and/or '*' between the digits of num so that the resultant expression evaluates to the target value.

Note that operands in the returned expressions should not contain leading zeros.

```txt
Example 1:

Input: num = "123", target = 6
Output: ["1*2*3","1+2+3"]
Explanation: Both "1*2*3" and "1+2+3" evaluate to 6.
```

```txt
Example 2:

Input: num = "232", target = 8
Output: ["2*3+2","2+3*2"]
Explanation: Both "2*3+2" and "2+3*2" evaluate to 8.
```

```txt
Example 3:

Input: num = "105", target = 5
Output: ["1*0+5","10-5"]
Explanation: Both "1*0+5" and "10-5" evaluate to 5.
Note that "1-05" is not a valid expression because the 5 has a leading zero.
```

```txt
Example 4:

Input: num = "00", target = 0
Output: ["0*0","0+0","0-0"]
Explanation: "0*0", "0+0", and "0-0" all evaluate to 0.
Note that "00" is not a valid expression because the 0 has a leading zero.
```

```txt
Example 5:

Input: num = "3456237490", target = 9191
Output: []
Explanation: There are no expressions that can be created from "3456237490" to evaluate to 9191.
```

Constraints:

- 1 <= num.length <= 10
- num consists of only digits.
- -2^31 <= target <= 2^31 - 1

## Solution Backtracking

```java
class Solution {
    public List<String> addOperators(String num, int target) {
        List<String> res = new ArrayList<>();
        backtrack(0, num, "", 0L, target, 0L, res);
        return res;
    }
    
    void backtrack(int index, String num, String expr, long sum, long target, long prev, List<String> res) {
        if (index == num.length()) {
            
            if (sum == target) {
                res.add(expr);
            }
            
            return;
        }
        
        for (int end = index; end < num.length(); end++) {
            String possibleValue = num.substring(index, end + 1);
            
            if (possibleValue.startsWith("0") && possibleValue.length() > 1) {
                continue;
            }
            
            Long value = Long.valueOf(possibleValue);
            
            if (index == 0) {
                backtrack(end + 1, num, "" + value, sum + value, target, value,  res);
            } else {
                backtrack(end + 1, num, expr + "+" + value, sum + value, target, value,  res);
                backtrack(end + 1, num, expr + "-" + value, sum - value, target, -value, res);
                backtrack(end + 1, num, expr + "*" + value, sum - prev + value * prev, target, prev * value, res);
            }
        }
    }
}
```
