---
author: "volyx"
title:  "139. Word Break"
date: "2021-05-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp", "memoization"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[139. Word Break](https://leetcode.com/problems/word-break/)

Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

```txt
Example 1:

Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:

Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.

Example 3:

Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false
```

Constraints:

- 1 <= s.length <= 300
- 1 <= wordDict.length <= 1000
- 1 <= wordDict[i].length <= 20
- s and wordDict[i] consist of only lowercase English letters.
- All the strings of wordDict are unique.

## Solution

```java
class Solution {
    public boolean wordBreak2(String s, List<String> wordDict) {
        Map<String, Boolean> memo = new HashMap<>();
        return search(s, wordDict, memo);
    }
    
    private boolean search(String s, 
                           List<String> wordDict, 
                           Map<String, Boolean> memo ) {
        
        if (s.length() == 0) {
            return true;
        }
        for (String key: wordDict) {
            if (s.startsWith(key)) {
                boolean find;
                String substr = s.substring(key.length(), s.length());
                if (memo.containsKey(substr)) {
                    find = memo.get(substr);
                } else {
                    find = search(substr, wordDict, memo);
                }
                memo.put(substr, find);
                if (find) return true;
            }
        }
        return false;
    }
    
    public boolean wordBreak(String s, List<String> wordDict) {
        boolean[] dp = new boolean[s.length() + 1];
        dp[0] = true;
        for (int i = 1; i < s.length() + 1; i++) {
            for (int j = 0; j < i; j++) {
                if (dp[j] && wordDict.indexOf(s.substring(j, i)) >=0 ) {
                    dp[i] = true;
                    break;
                }
            }
        }
        System.out.println(Arrays.toString(dp));
        return dp[s.length()];
    }
}
```

## Solution 2021-10-22

```java
class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        Map<String, Boolean> memo = new HashMap<>();
        return wordBreak(s, 0, wordDict, memo);
    }
    
    boolean wordBreak(String s, int index, List<String> words, Map<String, Boolean> memo) {
        
        if (s.length() == index) {
            return true;
        }
    
        for (String word: words) {
            if (s.startsWith(word, index)) {
                boolean isBreak = false;
                String subStr = s.substring(index, index + word.length());
                if (memo.containsKey(subStr)) {
                    isBreak = memo.get(subStr);
                } else {
                    isBreak = wordBreak(s, index + word.length(), words, memo);
                }
                
                memo.put(subStr, isBreak);
                if (isBreak) {
                    return true;
                }
            }
        }
        
        return false;
    }
}
```

## Solution Boolean[] array dp

```java
class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        Boolean[] memo = new Boolean[s.length() + 1];
        return wordBreak(s, 0, wordDict, memo);
    }
    
    boolean wordBreak(String s, int index, List<String> words, Boolean[] memo) {
        
        if (s.length() == index) {
            return true;
        }
    
        for (String word: words) {
            if (s.startsWith(word, index)) {
                boolean isBreak = false;
                if (memo[index + word.length()] != null) {
                    isBreak = memo[index + word.length()];
                } else {
                    isBreak = wordBreak(s, index + word.length(), words, memo);
                }
                
                memo[index + word.length()] = isBreak;
                if (isBreak) {
                    return true;
                }
            }
        }
        
        return false;
    }
}
```

## Solution 2022-01-22

```java
class Solution {
    public boolean wordBreak(String s, List<String> wordDict) {
        Boolean[] memo = new Boolean[s.length() + 1];
        return wordBreak(0, s, wordDict, memo);
    }

    boolean wordBreak(int index, String s, List<String> wordDict, Boolean[] memo) {
        if (index == s.length()) {
            return true;
        }
 
        for (String prefix: wordDict) {
            if (s.startsWith(prefix, index)) {
               int remainIndex = index + prefix.length();
               boolean res = false;
               if (memo[remainIndex] != null) {
                   res = memo[remainIndex];
               } else {
                   res = wordBreak(remainIndex, s, wordDict, memo); 
               }
               
               memo[remainIndex] = res;
               if (res) {
                   return true;
               } 
            } 
        }
        return false;
    }
}
```

## Solution BFS

```java
    public boolean wordBreak(String s, List<String> wordDict) {
        Set<String> wordSet = new HashSet(wordDict);
        boolean[] visited = new boolean[s.length()];
        Queue<Integer> q = new ArrayDeque<>();
        q.add(0);
        
        while (q.size() > 0) {
            int start = q.poll();
            if (visited[start]) {
                continue;
            }
            
            for (String word: wordDict) {
                if (s.startsWith(word, start)) {
                    q.add(start + word.length());
                    if (start + word.length() == s.length()) {
                        return true;
                    }
                }
            }
            visited[start] = true;
        }
        
        return false;
    }
```

