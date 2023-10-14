---
author: "volyx"
title:  "472. Concatenated Words"
date: "2021-12-10"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![472. Concatenated Words](https://leetcode.com/problems/concatenated-words/)

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

- 1 <= words.length <= 10^4
- 0 <= words[i].length <= 1000
- words[i] consists of only lowercase English letters.
- 0 <= sum(words[i].length) <= 10^5

## Solution DFS +  Cache

```java
class Solution {
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        Map<String, Boolean> cache = new HashMap<>();
        Set<String> wordSet = new HashSet<>(Arrays.asList(words));
        List<String> res = new ArrayList<>();
        for (String word: words) {
            if (dfs(word, wordSet, cache)) {
                res.add(word);
            }
        }
        return res;
    }
    
    boolean dfs(String word, Set<String> words, Map<String, Boolean> cache) {
        if (cache.containsKey(word)) {
            return cache.get(word);
        }
        for (int i = 1; i < word.length(); i++) {
            String prefix = word.substring(0, i);
            if (words.contains(prefix)) {
                String suffix = word.substring(i);
                if (cache.containsKey(suffix) || dfs(suffix, words, cache)) {
                    cache.put(word, true);
                    return true;
                }
            }
        }
        cache.put(word, false);
        return false;
    }
}
```

## Solution DFS + WordSet as Cache

```java
class Solution {
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        Set<String> wordSet = new HashSet<>(Arrays.asList(words));
        List<String> res = new ArrayList<>();
        for (String word: words) {
            if (dfs(word, wordSet)) {
                res.add(word);
            }
        }
        return res;
    }
    
    boolean dfs(String word, Set<String> words) {
        for (int i = 1; i < word.length(); i++) {
            String prefix = word.substring(0, i);
            if (words.contains(prefix)) {
                String suffix = word.substring(i);
                if (words.contains(suffix) || dfs(suffix, words)) {
                    words.add(word);
                    return true;
                }
            }
        }
        return false;
    }
}
```

## Solution[TLE on 43 test] DFS + Trie

```java
class Solution {
    public List<String> findAllConcatenatedWordsInADict(String[] words) {
        Set<String> wordSet = new HashSet<>(Arrays.asList(words));
        TrieNode root = new TrieNode('#');
        List<String> res = new ArrayList<>();
        for (String word: words) {
            TrieNode node = root;
            for (int i = 0; i < word.length(); i++) {
                char c = word.charAt(i);
                if (node.children[c - 'a'] == null) {
                    node.children[c - 'a'] = new TrieNode(c);
                }
                node = node.children[c - 'a'];
            }
            if (node != root) {
                node.isWord = true;
            }
        }
        for (String word: words) {
            if (dfs(root, word.toCharArray(), 0, word.length())) {
                res.add(word);
            }
        }
        print(root, 0);
        return res;
    }
    
    boolean isWord(TrieNode root, char[] chars, int left, int right) {
         TrieNode node = root;
        for (int i = left; i < right; i++) {
            char c = chars[i];
            if (node.children[c - 'a']  != null) {
                node = node.children[c - 'a'];
            } else {
                return false;
            }
            
        }
        if (node.isWord) {
            // System.out.println("\t " + new String(Arrays.copyOfRange(chars, left, right)) + " is word");
        }
        return node.isWord;
    }
    
    boolean dfs(TrieNode node, char[] chars, int left, int right) {
        // System.out.println("word = " + new String(Arrays.copyOfRange(chars, left, right)));
        for (int i = left; i < right; i++) {
            // System.out.println("\t prefix = " + new String(Arrays.copyOfRange(chars, left, i)));
            if (isWord(node, chars, left, i)) {
                 // System.out.println("\t suffix = " + new String(Arrays.copyOfRange(chars, i, right)));
                if (isWord(node, chars, i, right) || dfs(node, chars, i, right)) {
                    markWord(node, chars, i, right);
                    return true;
                }
            }
        }
        return false;
    }
    
    void print(TrieNode node, int begin) {
        System.out.println(" ".repeat(begin) + node.val + (node.isWord ? "*": ""));
        for(TrieNode child: node.children) {
           if (child != null)  print(child, begin + 2);
        }
    }
    
        
    void markWord(TrieNode root, char[] chars, int left, int right) {
        TrieNode node = root;
        for (int i = left; i < right; i++) {
            char c = chars[i];
            if (node.children[c - 'a']  != null) {
                node = node.children[c - 'a'];
            } else {
                return;
            }
        }
        node.isWord = true;
        // System.out.println("\t mark word = " + new String(Arrays.copyOfRange(chars, left, right)));
    }
}

class TrieNode {
    char val;
    TrieNode[] children = new TrieNode[26];
    boolean isWord;
    public TrieNode(char val) {
        this.val = val;
    }
}
```
