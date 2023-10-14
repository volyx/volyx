---
author: "volyx"
title:  "93. Restore IP Addresses"
date: "2021-05-21"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "dp", "dfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[93. Restore IP Addresses](https://leetcode.com/problems/restore-ip-addresses/)

Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.

A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses.

```txt
Example 1:

Input: s = "25525511135"
Output: ["255.255.11.135","255.255.111.35"]

Example 2:

Input: s = "0000"
Output: ["0.0.0.0"]

Example 3:

Input: s = "1111"
Output: ["1.1.1.1"]

Example 4:

Input: s = "010010"
Output: ["0.10.0.10","0.100.1.0"]

Example 5:

Input: s = "101023"
Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
```

Constraints:

- 0 <= s.length <= 3000
- s consists of digits only.

## Solution

```java
class Solution {
    public List<String> restoreIpAddresses(String s) {
        List<String> res = new ArrayList<>();
        restore(s, "", 0, res);
        return res;
    }
    
    void restore(String s, String ip, int index, List<String> res) {
        if (s.length() == 0) {
            if (index == 4) res.add(ip);
            return;
        }
        
        if (index > 4) return;
        
        String digit = s.substring(0, 1);
        
        String octet = ip.length() == 0 ? digit: ip + "." + digit;
        
        restore(s.substring(1, s.length()), octet, index + 1, res);
        
        if (s.startsWith("0")) return;
        
        if (s.length() > 1) {
            String twoDigits = s.substring(0, 2);
            octet = ip.length() == 0 ? twoDigits: ip + "." + twoDigits;
            restore(s.substring(2, s.length()), octet, index + 1, res);
        }
        
         if (s.length() > 2) {
            String threeDigits = s.substring(0, 3);
            octet = ip.length() == 0 ? threeDigits: ip + "." + threeDigits;
            if (Integer.valueOf(threeDigits) <= 255) {
                restore(s.substring(3, s.length()), octet, index + 1, res);
            }
        }
    }
}
```
