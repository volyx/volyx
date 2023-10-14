---
author: "volyx"
title:  "1859. Sorting the Sentence"
date: "2021-05-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "dp"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1859. Sorting the Sentence](https://leetcode.com/problems/sorting-the-sentence/)

A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of lowercase and uppercase English letters.

A sentence can be shuffled by appending the 1-indexed word position to each word then rearranging the words in the sentence.

- For example, the sentence "This is a sentence" can be shuffled as "sentence4 a3 is2 This1" or "is2 sentence4 This1 a3".

Given a shuffled sentence s containing no more than 9 words, reconstruct and return the original sentence.

```txt
Example 1:

Input: s = "is2 sentence4 This1 a3"
Output: "This is a sentence"
Explanation: Sort the words in s to their original positions "This1 is2 a3 sentence4", then remove the numbers.

Example 2:

Input: s = "Myself2 Me1 I4 and3"
Output: "Me Myself and I"
Explanation: Sort the words in s to their original positions "Me1 Myself2 and3 I4", then remove the numbers.
```

Constraints:

- 2 <= s.length <= 200
- s consists of lowercase and uppercase English letters, spaces, and digits from 1 to 9.
- The number of words in s is between 1 and 9.
- The words in s are separated by a single space.
- s contains no leading or trailing spaces.

## Solution

```java
class Solution {
    public String sortSentence(String s) {
        String[] words = s.split(" ");
        
        int n = words.length;
        String[] newWords = new String[n];
        for (int i = 0; i < words.length; i++) {
            Integer index = Integer.valueOf(words[i].substring(words[i].length() - 1, words[i].length()));
            newWords[index - 1] = words[i].substring(0, words[i].length() - 1);
        }
        StringBuilder sb = new StringBuilder();
        
        int i = 0;
        for (String w: newWords) {
            sb.append(w);
            if (i != n - 1) {
                sb.append(" ");
            }
            i++;    
        }
        return sb.toString();
    }
}
```
