---
author: "volyx"
title:  "1209. Remove All Adjacent Duplicates in String II"
date: "2021-02-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack", "repeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/]

Given a string s, a k duplicate removal consists of choosing k adjacent and equal letters from s and removing them causing the left and the right side of the deleted substring to concatenate together.

We repeatedly make k duplicate removals on s until we no longer can.

Return the final string after all such duplicate removals have been made.

It is guaranteed that the answer is unique.

```txt
Example 1:

Input: s = "abcd", k = 2
Output: "abcd"
Explanation: There's nothing to delete.

Example 2:

Input: s = "deeedbbcccbdaa", k = 3
Output: "aa"
Explanation: 
First delete "eee" and "ccc", get "ddbbbdaa"
Then delete "bbb", get "dddaa"
Finally delete "ddd", get "aa"

Example 3:

Input: s = "pbbcggttciiippooaais", k = 2
Output: "ps"
```

Constraints:

- 1 <= s.length <= 10^5
- 2 <= k <= 10^4
- s only contains lower case English letters.

```java
class Solution {
    public String removeDuplicates(String s, int k) {
        char[] symbols = s.toCharArray();
        char[] stack = new char[symbols.length];
        int[] duplicates = new int[symbols.length];
        int size = 0;
        for (int i = 0; i < symbols.length; i++) {
            char c = symbols[i];
            // if prev char is the same
            if (size > 0 && stack[size - 1] == c) {
                if ((duplicates[size - 1] + 1) == k) {
                    size -= k - 1;
                } else {
                    stack[size] = c;
                    duplicates[size] = duplicates[size - 1] + 1;
                    size++;
                }
            } else {
                // new char
                stack[size] = c;
                duplicates[size] = 1;
                size++;
            }
        }
        return new String(stack, 0, size);
    }

    public String removeDuplicates2(String s, int k) {
        char[] arr = s.toCharArray();
        List<Pair> stack = new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            char c = arr[i];
            if (stack.size() > 0) {
                Pair prev = stack.get(stack.size() - 1);
                if (prev.c == c) {
                    if (prev.count + 1 == k) {
                        stack.remove(stack.size() - 1);
                    } else {
                        prev.count++;
                    }
                } else {
                    stack.add(new Pair(c, 1));
                }
            } else {
                stack.add(new Pair(c, 1));
            }
        }
        StringBuilder sb = new StringBuilder();
        for (Pair p: stack) {
             for (int i = 0; i < p.count; i++)
                sb.append(p.c);
        }
        return sb.toString();
    }
    
    class Pair {
        char c;
        int count;
        public Pair(char c, int count) {
            this.c = c;
            this.count = count;
        }
    }
}
```

```java
class Solution {
    public String removeDuplicates(String s, int k) {
        Stack<int[]> stack = new Stack<>();
        
        for (int i = 0; i < s.length(); i++) {
            int count = 1;
            if (stack.size() > 0) {
                int index = stack.peek()[0];
                if (s.charAt(index) == s.charAt(i)) {
                    count = stack.peek()[1] + 1;
                }
            }
            stack.push(new int[] {i, count});
            if (k == count) {
                while (count > 0) {
                    stack.pop();
                    count--;
                }
            }
        }
        
        StringBuilder sb = new StringBuilder();
        
        while (stack.size() > 0) {
            sb.append(s.charAt(stack.pop()[0]));
            
        }
        return sb.reverse().toString();
    }
}
```
