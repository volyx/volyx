---
author: "volyx"
title:  "720. Longest Word in Dictionary"
date: "2021-05-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string", "trie"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[720. Longest Word in Dictionary](https://leetcode.com/problems/longest-word-in-dictionary/)

Given an array of strings words representing an English Dictionary, return the longest word in words that can be built one character at a time by other words in words.

If there is more than one possible answer, return the longest word with the smallest lexicographical order. If there is no answer, return the empty string.

```txt
Example 1:

Input: words = ["w","wo","wor","worl","world"]
Output: "world"
Explanation: The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
```

```txt
Example 2:

Input: words = ["a","banana","app","appl","ap","apply","apple"]
Output: "apple"
Explanation: Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
```

Constraints:

- 1 <= words.length <= 1000
- 1 <= words[i].length <= 30
- words[i] consists of lowercase English letters.

## Solution

```java
class Solution {
    static int R = 256;
    int max = 0;
    String longest = "";
    public String longestWord(String[] words) {
        Trie trie = new Trie('#');
        trie.isWord = true;
        for (String word: words) {
            trie.insert(word);
        }
        dfs(trie, "", 0);
        return longest;
    }
    
    void dfs(Trie node, String word, int counter) {
        if (node == null) return ;
        
        if (node.isWord == false) return;
        
        if (counter > max) {
            max = counter;
            longest = word;
        }
        
        for (Trie t: node.next) {
            if (t != null) {
               dfs(t, word + "" + t.symbol, counter + 1); 
            }
        }
    }
    
    class Trie {
        
        Trie[] next = new Trie[R];
        char symbol;
        boolean isWord;
        
        public Trie(char symbol) {
            this.symbol = symbol;
        }
        
        void insert(String word) {
            Trie node = this;
            int n = word.length();
            for (char c: word.toCharArray()) {
                Trie curr = node.next[c];
                if (curr == null) {
                    curr = new Trie(c);
                } 
                node.next[c] = curr;
                node = curr;
            }
            node.isWord = true;
        }
    }   
}
```
