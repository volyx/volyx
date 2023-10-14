---
author: "volyx"
title:  "Verifying an Alien Dictionary"
date: "2020-06-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "tripeat"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.

Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

```txt
Example 1:

Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
Output: true
Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

Example 2:

Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
Output: false
Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.

Example 3:

Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
Output: false
Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
```

Solution:

```java
class Solution {
    public boolean isAlienSorted(String[] words, String order) {
        if (words.length == 0) {
            return true;
        }
        if (words.length == 1) {
            return true;
        }

        Map<Character, Integer> alphabet = new HashMap<>();
        for (int i = 0; i < order.length(); i++) {
            alphabet.put(Character.valueOf(order.charAt(i)), i); // 012
        }

        String prev = words[0]; // ac // b

        for (int i = 1; i < words.length; i++) {
            String current = words[i]; // b
            if (!isSorted(prev, current, alphabet)) {
                return false;
            }
            prev = current;
        }
        return true;
    }
    boolean isSorted(String a, String b, Map<Character, Integer> alphabet) {
        for (int i = 0; i < Math.min(a.length(), b.length()); i++) {
            char c1 = a.charAt(i); // a
            char c2 = b.charAt(i); // b

            int index1 = alphabet.get(Character.valueOf(c1)); // 0
            int index2 = alphabet.get(Character.valueOf(c2)); // 1
            // System.out.println(c1 +" " + c2 + " " + index1 + " < " + index2);
            if (index1 < index2) {
                return true;
            } else if (index1 == index2) {
                continue;
            } else {
                return false;
            }
        } // for
        return a.length() <= b.length();
    }

}


## Solution 15-06-2021

```java
class Solution {
    public boolean isAlienSorted(String[] words, String order) {
        for (int i = 0; i < words.length - 1; i++) {
            String w1 = words[i];
            String w2 = words[i + 1];
            if (less(w1, w2, order)) {
                continue;
            } else {
                return false;
            }
        }
        return true;
    }
    
    boolean less(String w1, String w2, String order) {
        int len1 = w1.length();
        int len2 = w2.length();
        
        for (int i = 0; i < Math.min(len1, len2); i++) {
            int idx1 = order.indexOf(w1.charAt(i));
            int idx2 = order.indexOf(w2.charAt(i));
            if (idx1 < idx2) {
                return true;
            } else if (idx1 == idx2) {
                continue;
            } else {
                return false;
            }
        }
        return len1 <= len2;
    }
}
```

## Solution 2021-11-21

```java
class Solution {
    public boolean isAlienSorted(String[] words, String order) {
        int n = words.length;
        if (n == 0 || n == 1) return true;
        for (int i = 0; i < n - 1; i++) {
            if (!lessThan(words[i], words[i + 1], order)) {
                return false;
            }
        }
        return true;
    }
    
    boolean lessThan(String w1, String w2, String order) {
        int i = 0;
        int len1 = w1.length();
        int len2 = w2.length();
        while (i < Math.max(len1, len2)) {
            int id1 = i < len1 ? order.indexOf(w1.charAt(i)) : -1;
            int id2 = i < len2 ? order.indexOf(w2.charAt(i)): -1;
            if (id1 == id2) {
                i++;
                continue;
            } else {
                return id1 < id2;
            }
        }
        
        return true;
    }
}
```

## Solution 2022-01-22

```java
class Solution {
    public boolean isAlienSorted(String[] words, String order) {
        for (int i = 0; i < words.length - 1; i++) {
            if (!isSorted(words[i], words[i + 1], order)) {
                return false;
            }
        }
        return true;
    }
    
    boolean isSorted(String w1, String w2, String order) {
        
        int len1 = w1.length();
        int len2 = w2.length();
        
        int i = 0;
        
        while (i < Math.min(len1, len2)) {
            char c1 = w1.charAt(i);
            char c2 = w2.charAt(i);
            
            if (order.indexOf(c1) < order.indexOf(c2)) {
                return true;
            } else if (order.indexOf(c1) > order.indexOf(c2)) {
                return false;
            }
            i++;
        }
        return len1 <= len2;
    }
}
```
