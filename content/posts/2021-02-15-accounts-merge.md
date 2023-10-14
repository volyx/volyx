---
author: "volyx"
title:  "721. Accounts Merge"
date: "2021-02-15"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "union-find"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/accounts-merge/]

Given a list accounts, each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.

Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some email that is common to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.

After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

```txt
Example 1:

Input: 
accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],  ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]
Explanation: 
The first and third John's are the same person as they have the common email "johnsmith@mail.com".
The second John and Mary are different people as none of their email addresses are used by other accounts.
We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'], 
['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
```

Note:

- The length of accounts will be in the range [1, 1000].
- The length of accounts[i] will be in the range [1, 10].
- The length of accounts[i][j] will be in the range [1, 30].

```java
class Solution {
    public List<List<String>> accountsMerge(List<List<String>> accounts) {
        
        Map<String, Integer> emailToIndex = new HashMap<>();
        UF uf = new UF(accounts.size());
        for (int i = 0; i < accounts.size(); i++) {
            List<String> emails = accounts.get(i);
            
            for (int j = 1; j < emails.size(); j++) {
                String email = emails.get(j);
                Integer emailIndex = emailToIndex.get(email);
                if (emailIndex == null) {
                    emailToIndex.put(email, i);
                } else {
                    uf.union(i, emailIndex);
                }
            }
        }
        
        List<List<String>> merged = new ArrayList<>();
        Set<Integer> seen = new HashSet<>();
        for (int i = 0; i < accounts.size(); i++) {
            if (seen.contains(i)) {
                continue;
            }
            Set<String> emails = new TreeSet<>();
            List<String> accountEmails = accounts.get(i).subList(1, accounts.get(i).size());
            emails.addAll(accountEmails);
            String name = accounts.get(i).get(0);
            for (int j = i + 1; j < accounts.size(); j++) {
                if (uf.find(i) == uf.find(j)) {
                     accountEmails = accounts.get(j).subList(1, accounts.get(j).size());
                     emails.addAll(accountEmails);
                     seen.add(j);
                }
            }
            List<String> mergedAccount = new ArrayList<>(emails);
            mergedAccount.add(0, name);
            merged.add(mergedAccount);
        }
        return merged;
    }
    
    public class UF {
        private int[] a;
        
        public UF(int n) {
            this.a = new int[n];
            
            for (int i = 0; i < n; i++) {
                a[i] = i;
            }
        }
        
        void union(int p, int q) {

            int pid = find(p);
            int qid = find(q);
            
            a[qid] = pid;
        }
        
        int find(int p) {
            while (p != a[p]) {
                p = a[p];
            }
            return p;
        }
    }
}
```

## Solution 2021-10-01

```java
class Solution {
    public List<List<String>> accountsMerge(List<List<String>> accounts) {
        final UF uf = new UF();

        Map<String, Integer> emailIds = new HashMap<>();
        
        for (int i = 0; i < accounts.size(); i++) {
            List<String> account = accounts.get(i);
            String name = account.get(0);
            
            for (int j = 1; j < account.size(); j++) {
                String email = account.get(j);
                Integer prev = emailIds.get(email);
                if (prev != null) {
                    // System.out.println("join " + prev + " " + i);
                    emailIds.put(email, uf.union(prev, i));  
                } else {
                    emailIds.put(email, i);   
                }
            }
        }
        
        Map<Integer, List<String>> resultList = new HashMap<>();
        
        for (Map.Entry<String, Integer> entry : emailIds.entrySet()) {
            String key = entry.getKey();
            Integer id = uf.parent(entry.getValue()); 
            List<String> list = resultList.getOrDefault(id, new ArrayList<>());
            list.add(key);
            resultList.put(id, list);
        }
        
        List<List<String>> res = new ArrayList<>();
        
        for (Map.Entry<Integer, List<String>> entry : resultList.entrySet()) {
           List<String> emails = entry.getValue();
           Integer id = entry.getKey();
           Collections.sort(emails);
           emails.add(0, accounts.get(id).get(0));
           res.add(emails);
        }
        
        return res;
    }
    
    public static class UF {
        int[] a = new int[10_000];
        int[] sizes = new int[10_000];
        
        public UF() {
            for (int i = 0; i < a.length; i++) {
                a[i] = i;
                sizes[i] = 1;
            }
        }
        
        int union(int p, int q) {
            int pid = parent(p);
            int qid = parent(q);
            
            if (pid == qid) return pid;
            
            if (sizes[pid] > sizes[qid]) {
                a[qid] = pid;
                sizes[pid] += sizes[qid];
                return pid;
            } else {
                a[pid] = qid;
                sizes[qid] += sizes[pid];
                return qid;
            }
        }
        
        int parent(int p) {
            
            while (p != a[p]) {
                
                p = a[p];
            }
            return p;
        }
    }
}
```

## Solution 2022-01-29

```java
class Solution {
    int[] uf = new int[10_000];
    int[] sizes = new int[10_000];
    
    public List<List<String>> accountsMerge(List<List<String>> accounts) {
        for (int i = 0; i < 10_000; i++) {
            uf[i] = i;
            sizes[i] = 1;
        }
        Map<String, Integer> emailIds = new HashMap<>();
        for (int i = 0; i < accounts.size(); i++) {
            List<String> account = accounts.get(i);
            for (int j = 1; j < account.size(); j++) {
                String email = account.get(j);
                Integer prevId = emailIds.get(email);
                if (prevId != null) {
                    emailIds.put(email, union(prevId, i));
                } else {
                    emailIds.put(email, i);
                }
            }
        }
        
        
        Map<Integer, List<String>> resMap = new HashMap();
        
        for (String email: emailIds.keySet()) {
            Integer accountId = parent(emailIds.get(email));
            List<String> emails = resMap.getOrDefault(accountId, new ArrayList());
            emails.add(email);
            resMap.put(accountId, emails);
        }
        
        List<List<String>> res = new ArrayList<>();
        for (Integer accountId: resMap.keySet()) {
            List<String> emailList = resMap.get(accountId);
            Collections.sort(emailList);
            emailList.add(0, accounts.get(accountId).get(0));
            res.add(emailList);
        }
        
        return res;
    }
    
    int union(int p, int q) {
        int pid = parent(p);
        int qid = parent(q);
        
        if (sizes[pid] > sizes[qid]) {
            uf[qid] = pid;
            sizes[pid] += sizes[qid];
            return pid;
        } else {
            uf[pid] = qid;
            sizes[qid] += sizes[pid];
            return qid;
        }
    }
    
    int parent(int p) {
        while (uf[p] != p) {
            p = uf[p];
        }
        return p;
    }
}
```
