---
author: "volyx"
title:  "737. Sentence Similarity II"
date: "2021-10-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![737. Sentence Similarity II](https://leetcode.com/problems/sentence-similarity-ii/)

We can represent a sentence as an array of words, for example, the sentence "I am happy with leetcode" can be represented as arr = ["I","am",happy","with","leetcode"].

Given two sentences sentence1 and sentence2 each represented as a string array and given an array of string pairs similarPairs where similarPairs[i] = [xi, yi] indicates that the two words xi and yi are similar.

Return true if sentence1 and sentence2 are similar, or false if they are not similar.

Two sentences are similar if:

- They have the same length (i.e., the same number of words)
- sentence1[i] and sentence2[i] are similar.

Notice that a word is always similar to itself, also notice that the similarity relation is transitive. For example, if the words a and b are similar, and the words b and c are similar, then a and c are similar.

```txt
Example 1:

Input: sentence1 = ["great","acting","skills"], sentence2 = ["fine","drama","talent"], similarPairs = [["great","good"],["fine","good"],["drama","acting"],["skills","talent"]]
Output: true
Explanation: The two sentences have the same length and each word i of sentence1 is also similar to the corresponding word in sentence2.

Example 2:

Input: sentence1 = ["I","love","leetcode"], sentence2 = ["I","love","onepiece"], similarPairs = [["manga","onepiece"],["platform","anime"],["leetcode","platform"],["anime","manga"]]
Output: true
Explanation: "leetcode" --> "platform" --> "anime" --> "manga" --> "onepiece".
Since "leetcode is similar to "onepiece" and the first two words are the same, the two sentences are similar.

Example 3:

Input: sentence1 = ["I","love","leetcode"], sentence2 = ["I","love","onepiece"], similarPairs = [["manga","hunterXhunter"],["platform","anime"],["leetcode","platform"],["anime","manga"]]
Output: false
Explanation: "leetcode" is not similar to "onepiece".
```

Constraints:

- 1 <= sentence1.length, sentence2.length <= 1000
- 1 <= sentence1[i].length, sentence2[i].length <= 20
- sentence1[i] and sentence2[i] consist of lower-case and upper-case English letters.
- 0 <= similarPairs.length <= 2000
- similarPairs[i].length == 2
- 1 <= xi.length, yi.length <= 20
- xi and yi consist of English letters.

## Solution

```java
class Solution {
    int n = 0;
    int[] uf = new int[10_000];
    int[] sizes = new int[10_000];
    Map<String, Integer> indexes = new HashMap<>();
    
    public boolean areSentencesSimilarTwo(String[] sen1, String[] sen2, List<List<String>> similarPairs) {
        
        if (sen1.length != sen2.length) return false;

        for (List<String> pair: similarPairs) {
            add(pair.get(0), pair.get(1));
        }

        for (int i = 0; i < sen1.length; i++) {

            var word1 = sen1[i];
            var word2 = sen2[i];

            if (word1.equals(word2)) {
                continue;
            }

            if (!contains(word1)) {
                return false;
            }

            if (!contains(word2)) {
                return false;
            }

            if (!isConnected(word1, word2)) {
                return false;
            }
        }

        return true;
    }
            
    void add(String w1, String w2) {
        if (!indexes.containsKey(w1)) {
            indexes.put(w1, n);
            uf[n] = n;
            sizes[n] = 1;
            n++;
        }
        
        if (!indexes.containsKey(w2)) {
            indexes.put(w2, n);
            uf[n] = n;
            sizes[n] = 1;
            n++;
        } 
        
        int pid = parent(indexes.get(w1));
        int qid = parent(indexes.get(w2));
        
        if (sizes[pid] > sizes[qid]) {
            uf[qid] = pid;
            sizes[pid] += sizes[qid];
        } else {
            uf[pid] = qid;
            sizes[qid] += sizes[pid];
        }
    }
            
    boolean contains(String word) {
        return indexes.containsKey(word);
    }       
            
    boolean isConnected(String w1, String w2) {
        return parent(indexes.get(w1)) == parent(indexes.get(w2));
    } 
            
    int parent(int pid) {
        while (pid != uf[pid]) {
            pid = uf[pid];
        }
        
        return pid;
    }
}
```
