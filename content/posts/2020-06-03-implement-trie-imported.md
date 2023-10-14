---
author: "volyx"
title:  "Implement Trie (Prefix Tree)"
date: "2020-06-03"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Implement a trie with insert, search, and startsWith methods.

Example:

Trie trie = new Trie();

trie.insert("apple");
trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");
trie.search("app");     // returns true

Note:

- You may assume that all inputs are consist of lowercase letters a-z.
- All inputs are guaranteed to be non-empty strings.

Solution:

```java
class Trie {

    Trie[] children = new Trie[26];
    boolean isLeaf = false;

    /** Initialize your data structure here. */
    public Trie() {
    }

    /** Inserts a word into the trie. */
    public void insert(String word) {
        Trie node = this;
        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            if (node.children[c - 'a'] == null) {
                node.children[c - 'a'] = new Trie();;
            }
            node = node.children[c - 'a'];

        }
        node.isLeaf = true;
    }

    /** Returns if the word is in the trie. */
    public boolean search(String word) {
        Trie node = this;
        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            node = node.children[c - 'a'];
            if (node == null) {
               return false;
            } 
        }
        return node.isLeaf;
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    public boolean startsWith(String prefix) {
        Trie node = this;
        for (int i = 0; i < prefix.length(); i++) {
            char c = prefix.charAt(i);
            node = node.children[c - 'a'];
            if (node == null) {
               return false;
            }
        }
        return true;
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = new Trie();
 * obj.insert(word);
 * boolean param_2 = obj.search(word);
 * boolean param_3 = obj.startsWith(prefix);
 */
