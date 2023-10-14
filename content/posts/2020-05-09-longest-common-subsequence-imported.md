---
author: "volyx"
title:  "Longest Common Subsequence"
date: "2020-05-09"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given two strings text1 and text2, return the length of their longest common subsequence.

A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

If there is no common subsequence, return 0.

Example 1:
```
Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
```

Example 2:
```
Input: text1 = "abc", text2 = "abc"
Output: 3
Explanation: The longest common subsequence is "abc" and its length is 3.
```

Example 3:
```
Input: text1 = "abc", text2 = "def"
Output: 0
Explanation: There is no such common subsequence, so the result is 0.
```
 
Constraints:
```
    1 <= text1.length <= 1000
    1 <= text2.length <= 1000
    The input strings consist of lowercase English characters only.
```

Solution:

```java
class Solution {
    
    private Map<Integer, Integer> map = new HashMap<>();
    private String _text1, _text2;
    
    private Integer buildKey(int len1, int len2) {
        return Objects.hash(len1 + "_" + len2);
    }
    
    public int myLCS(int len1, int len2) {
        if (len1 == 0 || len2 == 0) {
            return 0;
        }
        
        Integer key = buildKey(len1, len2);
        
        if (map.containsKey(key)) {
            return map.get(key);
        }
        
        if (_text1.charAt(len1 - 1) == _text2.charAt(len2 - 1)) {
            int value = 1 + myLCS(len1 - 1, len2 - 1);
            map.put(key, value);
            return value;
        }
        
        int left = myLCS(len1, len2 - 1);
        int right = myLCS(len1 - 1, len2);
      
        map.put(key, Math.max(left, right));
        
        return Math.max(left, right);
    }
    
    public int iterativeLCS(String a, String b) {
        int n = a.length();
        int m = b.length();
        int[][] dp = new int[n + 1][m + 1];
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < m; ++j) {
                if (a.charAt(i) == b.charAt(j)) {
                    dp[i+1][j+1] = 1 + dp[i][j];
                } else {
                    dp[i+1][j+1] = Math.max(dp[i + 1][j], dp[i][j + 1]);
                }
            }
        }
        return dp[n][m];
    }
    
    public int longestCommonSubsequence(String _text1, String _text2) {
        return iterativeLCS(_text1, _text2);
    }
    
    private Integer buildKey(String text1, String text2) {
        return Objects.hashCode(text1 + "_" + text2);
    }
    
    public int longestCommonSubsequence2(String text1, String text2) {
        
        if (text1.isEmpty() || text2.isEmpty()) {
            return 0;
        }
        
        Integer key = buildKey(text1, text2);
        
        if (map.containsKey(key)) {
            return map.get(key);
        }
        
        if (text1.charAt(text1.length() - 1) == text2.charAt(text2.length() - 1)) {
            text1 = text1.substring(0, text1.length() - 1);
            text2 = text2.substring(0, text2.length() - 1);
            int value = 1 + longestCommonSubsequence(text1, text2);
            
            map.put(key, value);
            return value;
        }
        
        int left = longestCommonSubsequence(text1, text2.substring(0, text2.length() - 1));
        int right = longestCommonSubsequence(text1.substring(0, text1.length() - 1), text2);
      
        map.put(key, Math.max(left, right));
        
        return Math.max(left, right);
    }
    
    public int longestCommonSubsequence1(String text1, String text2) {
        
        if (text1.isEmpty() || text2.isEmpty()) {
            return 0;
        }
        
        if (text1.charAt(text1.length() - 1) == text2.charAt(text2.length() - 1)) {
            text1 = text1.substring(0, text1.length() - 1);
            text2 = text2.substring(0, text2.length() - 1);
            return 1 + longestCommonSubsequence(text1, text2);
        }
        
        return Math.max(
            longestCommonSubsequence(text1, text2.substring(0, text2.length() - 1)),
            longestCommonSubsequence(text1.substring(0, text1.length() - 1), text2)
        );
    }
}
```
