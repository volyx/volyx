---
author: "volyx"
title:  "472. Concatenated Words"
date: "2021-05-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dp", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[472. Concatenated Words](https://leetcode.com/problems/concatenated-words/)

Given an array of strings words (without duplicates), return all the concatenated words in the given list of words.

A concatenated word is defined as a string that is comprised entirely of at least two shorter words in the given array.

```txt
Example 1:

Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
"dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
"ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".

Example 2:

Input: words = ["cat","dog","catdog"]
Output: ["catdog"]
```

Constraints:

- 1 <= words.length <= 104
- 0 <= words[i].length <= 1000
- words[i] consists of only lowercase English letters.
- 0 <= sum(words[i].length) <= 105

## Solution

```java
class Solution {
    
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        List<String> res = new ArrayList<>();
        Set<String> set = new HashSet<>(Arrays.asList(words));
        for (String word: words) {
            if (word.length() == 0) continue;
            set.remove(word);
            boolean[] dp = new boolean[word.length() + 1];
            dp[0] = true;
            for (int i = 1; i < dp.length; i++) {
                for (int j = i - 1; j >= 0; j--) {
                    if (dp[j] && set.contains(word.substring(j, i))) {
                        dp[i] = true;
                        break;
                    }
                }
            }
            if (dp[word.length()]) {
                res.add(word);
            }
            set.add(word);
        }
        return res;
    }    
    
    public List<String> findAllConcatenatedWordsInADict2(String[] words) {
        List<String> res = new ArrayList<>();
        List<String> current = new ArrayList<>();
        Arrays.sort(words, (w1, w2) -> Integer.compare(w1.length(), w2.length()));
        Set<String> set = new HashSet<>(Arrays.asList(words));
        for (String word: words) {
            set.remove(word);
            if (dfs(word, set, "")) {
                res.add(word);
            }
            set.add(word);
        }
        return res;
    }
    boolean dfs(String word, Set<String> set, String prev) {
        if (set.contains(word)) return true;
        for (int i = 1; i < word.length(); i++) {
            String prefix = word.substring(0, i);
            if (set.contains(prefix)) {
               String newPrefix = prev + prefix; 
               set.add(newPrefix); 
               if (dfs(word.substring(prefix.length(), word.length()), set, newPrefix)) {
                   return true;
               }
            }
        }
        return false;
    }
}
```
