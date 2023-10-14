---
author: "volyx"
title:  "1845. Seat Reservation Manager"
date: "2021-05-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "heap"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[1845. Seat Reservation Manager](https://leetcode.com/problems/seat-reservation-manager/)

Design a system that manages the reservation state of n seats that are numbered from 1 to n.

Implement the SeatManager class:

- SeatManager(int n) Initializes a SeatManager object that will manage n seats numbered from 1 to n. All seats are initially available.
- int reserve() Fetches the smallest-numbered unreserved seat, reserves it, and returns its number.
- void unreserve(int seatNumber) Unreserves the seat with the given seatNumber.

```txt
Example 1:

Input
["SeatManager", "reserve", "reserve", "unreserve", "reserve", "reserve", "reserve", "reserve", "unreserve"]
[[5], [], [], [2], [], [], [], [], [5]]
Output
[null, 1, 2, null, 2, 3, 4, 5, null]
```

Explanation
SeatManager seatManager = new SeatManager(5); // Initializes a SeatManager with 5 seats.
seatManager.reserve();    // All seats are available, so return the lowest numbered seat, which is 1.
seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seatManager.unreserve(2); // Unreserve seat 2, so now the available seats are [2,3,4,5].
seatManager.reserve();    // The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seatManager.reserve();    // The available seats are [3,4,5], so return the lowest of them, which is 3.
seatManager.reserve();    // The available seats are [4,5], so return the lowest of them, which is 4.
seatManager.reserve();    // The only available seat is seat 5, so return 5.
seatManager.unreserve(5); // Unreserve seat 5, so now the available seats are [5].

Constraints:

- 1 <= n <= 105
- 1 <= seatNumber <= n
- For each call to reserve, it is guaranteed that there will be at least one unreserved seat.
- For each call to unreserve, it is guaranteed that seatNumber will be reserved.
- At most 105 calls in total will be made to reserve and unreserve.

## Solution

```java
cclass SeatManager {
    BitSet bits;
    public SeatManager(int n) {
        bits = new BitSet(n);
    }
    
    public int reserve() {
        int pos = bits.nextClearBit(1);
        bits.set(pos);
        return pos;
    }
    
    public void unreserve(int seatNumber) {
        bits.flip(seatNumber);
    }
}

class SeatManager1 {
    
    PriorityQueue<Integer> pq = new PriorityQueue<>();
    int curr = 1;
    public SeatManager1(int n) {
        // for (int i = 1; i <= n; i++) {
        //     pq.add(i);
        // }
    }
    
    public int reserve() {
        if (pq.size() > 0) {
            return pq.poll();
        }
        return curr++;
    }
    
    public void unreserve(int seatNumber) {
        pq.add(seatNumber);
    }
}


class SeatManager2 {
    
    PriorityQueue<Integer> pq = new PriorityQueue<>();
    public SeatManager2(int n) {
        for (int i = 1; i <= n; i++) {
            pq.add(i);
        }
    }
    
    public int reserve() {
        return pq.poll();
    }
    
    public void unreserve(int seatNumber) {
        pq.add(seatNumber);
    }
}

/**
[null, 1, 2, null, 2, 3, 4, 5, null]
[null,1,2,null,2,3,4,5,null]
 * Your SeatManager object will be instantiated and called as such:
 * SeatManager obj = new SeatManager(n);
 * int param_1 = obj.reserve();
 * obj.unreserve(seatNumber);
 */
```
