---
author: "volyx"
title:  "468. Validate IP Address"
date: "2021-11-21"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![468. Validate IP Address](https://leetcode.com/problems/validate-ip-address/)

Given a string queryIP, return "IPv4" if IP is a valid IPv4 address, "IPv6" if IP is a valid IPv6 address or "Neither" if IP is not a correct IP of any type.

A valid IPv4 address is an IP in the form "x1.x2.x3.x4" where 0 <= xi <= 255 and xi cannot contain leading zeros. For example, "192.168.1.1" and "192.168.1.0" are valid IPv4 addresses but "192.168.01.1", while "192.168.1.00" and "192.168@1.1" are invalid IPv4 addresses.

A valid IPv6 address is an IP in the form "x1:x2:x3:x4:x5:x6:x7:x8" where:

- 1 <= xi.length <= 4
- x_i is a hexadecimal string which may contain digits, lower-case English letter ('a' to 'f') and upper-case English letters ('A' to 'F').
- Leading zeros are allowed in xi.

For example, "2001:0db8:85a3:0000:0000:8a2e:0370:7334" and "2001:db8:85a3:0:0:8A2E:0370:7334" are valid IPv6 addresses, while "2001:0db8:85a3::8A2E:037j:7334" and "02001:0db8:85a3:0000:0000:8a2e:0370:7334" are invalid IPv6 addresses.

```txt
Example 1:

Input: queryIP = "172.16.254.1"
Output: "IPv4"
Explanation: This is a valid IPv4 address, return "IPv4".

Example 2:

Input: queryIP = "2001:0db8:85a3:0:0:8A2E:0370:7334"
Output: "IPv6"
Explanation: This is a valid IPv6 address, return "IPv6".

Example 3:

Input: queryIP = "256.256.256.256"
Output: "Neither"
Explanation: This is neither a IPv4 address nor a IPv6 address.

Example 4:

Input: queryIP = "2001:0db8:85a3:0:0:8A2E:0370:7334:"
Output: "Neither"

Example 5:

Input: queryIP = "1e1.4.5.6"
Output: "Neither"
```

Constraints:

- queryIP consists only of English letters, digits and the characters '.' and ':'.

## Solution

```java
class Solution {
    public String validIPAddress(String queryIP) {
        if (queryIP.indexOf(".") > 0 && tryIpv4(queryIP)) {
            return "IPv4";
        } else if (queryIP.indexOf(":") > 0 && tryIpv6(queryIP)) {
            return "IPv6";
        } else {
            return "Neither";
        }
    }
    
    boolean tryIpv6(String queryIP) {
        int count = 0;
        for (int i = 0; i < queryIP.length(); i++) {
            if (queryIP.charAt(i) == ':') count++;
        }
        if (count != 7) return false;
        String[] parts = queryIP.split(":");
        if (parts.length != 8) {
            return false;
        }
        
        for (int i = 0; i < 8; i++) {
            if (!isValidIpv6Part(parts[i])) {
                return false;
            }
        }
        return true;
    }
    
    boolean tryIpv4(String queryIP) {
        int count = 0;
        for (int i = 0; i < queryIP.length(); i++) {
            if (queryIP.charAt(i) == '.') count++;
        }
        if (count != 3) return false;
        String[] parts = queryIP.split("\\.");
        if (parts.length != 4) {
            return false;
        }
        return isValidIpv4Part(parts[0]) 
            && isValidIpv4Part(parts[1]) 
             && isValidIpv4Part(parts[2]) 
             && isValidIpv4Part(parts[3]);
    }
    
    boolean isValidIpv4Part(String val) {
        if (val.equals("0")) {
            return true;
        }
        
        if (val.startsWith("0") || val.length() == 0) return false;
        
        try {
            Integer intValue = Integer.parseInt(val);
            return intValue > 0 && intValue < 256;
        } catch(Exception e) {
            return false;
        }
    }
    
    boolean isValidIpv6Part(String val) {

        if (val.length() == 0 || val.length() > 4) return false;
        
        try {
            Integer intValue = Integer.parseInt(val, 16);
            return true;
        } catch(Exception e) {
            return false;
        }
    }
}
```
