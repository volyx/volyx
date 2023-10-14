---
author: "volyx"
title:  "535. Encode and Decode TinyURL"
date: "2021-04-30"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string", "huffman-tree"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[535. Encode and Decode TinyURL](https://leetcode.com/problems/encode-and-decode-tinyurl/)

> Note: This is a companion problem to the System Design problem: Design TinyURL.

TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk. Design a class to encode a URL and decode a tiny URL.

There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.

Implement the Solution class:

- Solution() Initializes the object of the system.
- String encode(String longUrl) Returns a tiny URL for the given longUrl.
- String decode(String shortUrl) Returns the original long URL for the given shortUrl.
- It is guaranteed that the given shortUrl was encoded by the same object.

```txt
Example 1:

Input: url = "https://leetcode.com/problems/design-tinyurl"
Output: "https://leetcode.com/problems/design-tinyurl"

Explanation:
Solution obj = new Solution();
string tiny = obj.encode(url); // returns the encoded tiny url.
string ans = obj.decode(tiny); // returns the original url after deconding it.
```

Constraints:

- 1 <= url.length <= 104
- url is guranteed to be a valid URL.

## Solution

```java
public class Codec {
    char[] symbols = new char[256];
    int[] freq = new int[256];
    String[] huffman = new String[256];
    Node root = null;

    // Encodes a URL to a shortened URL.
    public String encode(String longUrl) {
        for (char c: longUrl.toCharArray()) {
            freq[c]++;
            symbols[c] = c;
        }
        
        Queue<Node> pq = new PriorityQueue<>((a,b) -> {
           return Integer.compare(a.val, b.val);
        });
        
        for (int i = 0; i < freq.length; i++) {
            if (freq[i] > 0) {
                pq.add(new Node(symbols[i], freq[i]));
            }
        }
        root = null;
        while (pq.size() > 1) {
            Node left = pq.poll();
            Node right = pq.poll();
            Node node = new Node(' ', left.val + right.val, left, right);
            root = node;
            pq.add(node);
        }
        
        createHuffman(root, "");
        
        StringBuilder sb = new StringBuilder("http://tinyurl.com/");
        for (char c: longUrl.toCharArray()) {
            sb.append(huffman[c]);
        }
        return sb.toString();
    }
    
    void createHuffman(Node node, String val) {
        if (node.left == null && node.right == null) {
            huffman[node.c] = val;
            return;
        }
        
        createHuffman(node.left, val + "0");
        createHuffman(node.right, val + "1");
    }

    // Decodes a shortened URL to its original URL.
    public String decode(String shortUrl) {
        int len = shortUrl.length();
        StringBuilder url = new StringBuilder();
        
        // {0..18} is "http://tinyurl.com/" so ignore it during decoding
        for (int i = 19; i < len;) {
            Node node = root;
            while (node.left != null && node.right != null) {
                if (shortUrl.charAt(i) == '0') {
                    node = node.left;
                } else {
                    node = node.right;
                }
                i++;
            }
            url.append(node.c);
        }
        return url.toString();
    }
    
    class Node {
        char c;
        int val;
        Node left;
        Node right;
        
        public Node(char c, int val) {
            this.c = c;
            this.val = val;
        }
        public Node(char c, int val, Node left, Node right) {
            this.c = c;
            this.val = val;
            this.left = left;
            this.right = right;
        }
    }
}

// Your Codec object will be instantiated and called as such:
// Codec codec = new Codec();
// codec.decode(codec.encode(url));
```
