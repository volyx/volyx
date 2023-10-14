---
author: "volyx"
title:  "773. Sliding Puzzle"
date: "2021-02-07"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "A*", "BFS"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![https://leetcode.com/problems/sliding-puzzle/]

On a 2x3 board, there are 5 tiles represented by the integers 1 through 5, and an empty square represented by 0.

A move consists of choosing 0 and a 4-directionally adjacent number and swapping it.

The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].

Given a puzzle board, return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.

Examples:

```txt
Input: board = [[1,2,3],[4,0,5]]
Output: 1
Explanation: Swap the 0 and the 5 in one move.

Input: board = [[1,2,3],[5,4,0]]
Output: -1
Explanation: No number of moves will make the board solved.

Input: board = [[4,1,2],[5,0,3]]
Output: 5
Explanation: 5 is the smallest number of moves that solves the board.
An example path:
After move 0: [[4,1,2],[5,0,3]]
After move 1: [[4,1,2],[0,5,3]]
After move 2: [[0,1,2],[4,5,3]]
After move 3: [[1,0,2],[4,5,3]]
After move 4: [[1,2,0],[4,5,3]]
After move 5: [[1,2,3],[4,5,0]]

Input: board = [[3,2,4],[1,5,0]]
Output: 14
```

Note:

- board will be a 2 x 3 array as described above.
- board[i][j] will be a permutation of [0, 1, 2, 3, 4, 5].

```java
class Solution {
    public int slidingPuzzle(int[][] board) {
        Board initial = new Board(board);
        PriorityQueue<SearchNode> minPQ = new PriorityQueue<>();
        minPQ.add(new SearchNode(null, initial));
        Set<Board> seen = new HashSet<>();
        seen.add(initial);
        SearchNode find = null;
        while (!minPQ.isEmpty()) {
            final SearchNode searchNode = minPQ.poll();
            if (searchNode.board.isGoal()) {
                find = searchNode;
                break;
            }
            for (Board childBoard : searchNode.board.neighbors()) {
                SearchNode childNode = new SearchNode(searchNode, childBoard);
                if (seen.contains(childBoard)) {
                    continue;
                } else {
                    seen.add(childBoard);
                }
                minPQ.add(childNode);
            }
        }

        List<Board> path = new ArrayList<>();
        SearchNode currentNode = find;
        while (currentNode != null) {
            path.add(currentNode.board);
            currentNode = currentNode.previous;
        }
        Collections.reverse(path);

        if (path.isEmpty()) {
            return -1;
        }

        return path.size() - 1;
    }

    static class SearchNode implements Comparable<SearchNode> {

        private final SearchNode previous;
        private final Board board;
        private final int moves;

        private SearchNode(SearchNode previous, Board board) {
            this.previous = previous;
            this.board = board;
            this.moves = previous == null ? 0 : previous.moves + 1;
        }

        public int compareTo(SearchNode that) {
            return Integer.compare(this.moves, that.moves);
        }

        public boolean equals(Object object) {
            if (this == object) return true;
            if (object == null || getClass() != object.getClass()) return false;
            SearchNode that = (SearchNode) object;
            return moves == that.moves &&
                    Objects.equals(previous, that.previous) &&
                    Objects.equals(board, that.board);
        }

        public int hashCode() {
            return Objects.hash(previous, board, moves);
        }
    }

    static int[][] copyTiles(int[][] tiles) {
        int n = tiles.length;
        int m = tiles[0].length;
        int[][] tilesCopy = new int[n][m];
        int[] distinct = new int[n * m];
        for (int i = 0; i < tiles.length; i++) {
            for (int j = 0; j < tiles[i].length; j++) {
                tilesCopy[i][j] = tiles[i][j];
                distinct[tiles[i][j]]++;
            }
        }

        for (int i = 0; i < distinct.length; i++) {
            if (distinct[i] != 1) {
                throw new IllegalArgumentException(Arrays.toString(distinct));
            }
        }
        return tilesCopy;
    }

    static class Board {
        int[][] DIRECTIONS = {
                {0, 1},
                {0, -1},
                {1, 0},
                {-1, 0}
        };

        private final int[][] tiles;

        // create a board from an n-by-n array of tiles,
        // where tiles[row][col] = tile at (row, col)
        public Board(int[][] tiles) {
            if (tiles == null) {
                throw new IllegalArgumentException();
            }
            this.tiles = copyTiles(tiles);
        }

        // string representation of this board
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(tiles.length).append("\n");
            for (int i = 0; i < tiles.length; i++) {
                for (int j = 0; j < tiles[i].length; j++) {
                    int tile = this.tiles[i][j];
                    if (tile < 10) {
                        sb.append(" ").append(tile).append(" ");
                    } else {
                        sb.append(tile).append(" ");
                    }
                }
                sb.append("\n");
            }
            return sb.toString();
        }

        // is this board the goal board?
        public boolean isGoal() {
            for (int i = 0; i < tiles.length; i++) {
                for (int j = 0; j < tiles[i].length; j++) {

                    final int val = tiles[i][j];
                    if (val == 0 && i == tiles.length - 1 && j == tiles[0].length - 1) {
                        continue;
                    } else if (val != 0 && val == i * tiles[i].length + j + 1) {
                        continue;
                    } else {
                        return false;
                    }

                }
            }
            return true;
        }

        // all neighboring boards
        public Iterable<Board> neighbors() {

            final List<Board> boards = new ArrayList<>();

            int n = this.tiles.length;
            int m = this.tiles[0].length;
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    if (this.tiles[i][j] == 0) {
                        for (int[] direction : DIRECTIONS) {
                            int row = i + direction[0];
                            int col = j + direction[1];
                            if (row >= 0 && row < n && col >= 0 && col < m) {
                                int[][] tilesCopy = copyTiles(this.tiles);
                                tilesCopy[i][j] = tilesCopy[row][col];
                                tilesCopy[row][col] = 0;
                                boards.add(new Board(tilesCopy));
                            }
                        }
                        break;
                    }
                }
            }

            return boards;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            Board board = (Board) o;
            return Arrays.deepEquals(tiles, board.tiles);
        }

        @Override
        public int hashCode() {
            return Arrays.deepHashCode(tiles);
        }
    }
}
