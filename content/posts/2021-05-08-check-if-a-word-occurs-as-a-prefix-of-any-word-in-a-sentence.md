---
author: "volyx"
title:  "1455. Check If a Word Occurs As a Prefix of Any Word in a Sentence"
date: "2021-05-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1455. Check If a Word Occurs As a Prefix of Any Word in a Sentence](https://leetcode.com/problems/check-if-a-word-occurs-as-a-prefix-of-any-word-in-a-sentence/)

Given a sentence that consists of some words separated by a single space, and a searchWord.

You have to check if searchWord is a prefix of any word in sentence.

Return the index of the word in sentence where searchWord is a prefix of this word (1-indexed).

If searchWord is a prefix of more than one word, return the index of the first word (minimum index). If there is no such word return -1.

A prefix of a string S is any leading contiguous substring of S.

```txt
Example 1:

Input: sentence = "i love eating burger", searchWord = "burg"
Output: 4
Explanation: "burg" is prefix of "burger" which is the 4th word in the sentence.
```

```txt
Example 2:

Input: sentence = "this problem is an easy problem", searchWord = "pro"
Output: 2
Explanation: "pro" is prefix of "problem" which is the 2nd and the 6th word in the sentence, but we return 2 as it's the minimal index.
```

```txt
Example 3:

Input: sentence = "i am tired", searchWord = "you"
Output: -1
Explanation: "you" is not a prefix of any word in the sentence.
```

```txt
Example 4:

Input: sentence = "i use triple pillow", searchWord = "pill"
Output: 4
```

```txt
Example 5:

Input: sentence = "hello from the other side", searchWord = "they"
Output: -1
```

Constraints:

- 1 <= sentence.length <= 100
- 1 <= searchWord.length <= 10
- sentence consists of lowercase English letters and spaces.
- searchWord consists of lowercase English letters.

## Solution

```java
class Solution {
    
    public int isPrefixOfWord(String sentence, String searchWord) {
        int wordsCount = 0;
        for (int i = 0; i < sentence.length(); i++) {
            if (i == 0 || sentence.charAt(i - 1) == ' ') {
                wordsCount++;
                int j = 0;
                while (j < searchWord.length() 
                       && sentence.charAt(i) == searchWord.charAt(j)) {
                    i++;
                    j++;
                }
                if (j == searchWord.length()) {
                    return wordsCount;
                }
            } 
        }
        return -1;
    }
    
    public int isPrefixOfWord2(String sentence, String searchWord) {
        int wordsCount = 0;
        int j = 0;
        boolean start = true;
        for (int i = 0; i < sentence.length(); i++) {
            char c = sentence.charAt(i);
            if (c == ' ') {
                wordsCount++;
                j = 0;
                start = true;
            } else {
                if (start && c == searchWord.charAt(j)) {
                    j++;
                } else {
                    start = false;
                }
                if (j == searchWord.length()) {
                    return wordsCount + 1;
                }
            }
        }
        return -1;
    }
}
```
