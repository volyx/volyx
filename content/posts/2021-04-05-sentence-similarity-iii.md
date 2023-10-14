---
author: "volyx"
title:  "1813. Sentence Similarity III"
date: "2021-04-05"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1813. Sentence Similarity III](https://leetcode.com/problems/sentence-similarity-iii/)

A sentence is a list of words that are separated by a single space with no leading or trailing spaces. For example, "Hello World", "HELLO", "hello world hello world" are all sentences. Words consist of only uppercase and lowercase English letters.

Two sentences sentence1 and sentence2 are similar if it is possible to insert an arbitrary sentence (possibly empty) inside one of these sentences such that the two sentences become equal. For example, sentence1 = "Hello my name is Jane" and sentence2 = "Hello Jane" can be made equal by inserting "my name is" between "Hello" and "Jane" in sentence2.

Given two sentences sentence1 and sentence2, return true if sentence1 and sentence2 are similar. Otherwise, return false.

```txt
Example 1:

Input: sentence1 = "My name is Haley", sentence2 = "My Haley"
Output: true
Explanation: sentence2 can be turned to sentence1 by inserting "name is" between "My" and "Haley".
```

```txt
Example 2:

Input: sentence1 = "of", sentence2 = "A lot of words"
Output: false
Explanation: No single sentence can be inserted inside one of the sentences to make it equal to the other.
```

```txt
Example 3:

Input: sentence1 = "Eating right now", sentence2 = "Eating"
Output: true
Explanation: sentence2 can be turned to sentence1 by inserting "right now" at the end of the sentence.
```

```txt
Example 4:

Input: sentence1 = "Luky", sentence2 = "Lucccky"
Output: false
```

Constraints:

- 1 <= sentence1.length, sentence2.length <= 100
- sentence1 and sentence2 consist of lowercase and uppercase English letters and spaces.
- The words in sentence1 and sentence2 are separated by a single space.

## Solution

```java
class Solution {
    public boolean areSentencesSimilar(String sentence1, String sentence2) {
        String[] words1 = sentence1.split(" ");
        String[] words2 = sentence2.split(" ");
        
        int n1 = words1.length;
        int n2 = words2.length;
        
        if (n2 < n1) {
            return areSentencesSimilar(sentence2, sentence1);
        }
        
        int i = 0;
        while (i < n1 && words1[i].equals(words2[i])) {
            i++;
        }
        
        while (i < n1 && words1[i].equals(words2[n2 - n1 + i])) {
            i++;
        }
        return n1 == i;
    }
}
```
