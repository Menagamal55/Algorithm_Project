Algorithm Project
Minimum Difficulty of a Job Schedule Problem
Problem Description

The Minimum Difficulty of a Job Schedule problem aims to schedule a sequence of jobs over a fixed number of days such that the total difficulty is minimized.

Each job has a certain difficulty, and the difficulty of a single day is defined as the maximum difficulty among the jobs assigned to that day.

Constraints

Jobs must be scheduled in the given order (no reordering).

Each day must contain at least one job.

All jobs must be scheduled within exactly d days.

Objective

Determine the minimum possible total difficulty of scheduling all jobs over d days.

Solutions Implemented

The problem is solved using multiple approaches to demonstrate different algorithmic strategies and their efficiency:

1. Naive Recursive Solution (Brute Force)

Tries all possible ways to split the jobs across days.

Uses recursion without memoization.

Time Complexity: Exponential

Space Complexity: O(d)

2. Top-Down Dynamic Programming (DFS + Memoization)

Avoids repeated calculations by storing results.

Uses recursion with memoization.

Time Complexity: O(n² × d)

Space Complexity: O(n × d)

3. Bottom-Up Dynamic Programming

Builds the solution iteratively.

Uses space optimization with one-dimensional DP arrays.

Time Complexity: O(n² × d)

Space Complexity: O(n)

4. Optimized Solution Using Monotonic Stack

Improves performance by reducing redundant comparisons.

Uses a monotonic stack to optimize transitions.

Time Complexity: O(n × d)

Space Complexity: O(n)

Conclusion

This project highlights how algorithmic optimizations—from brute force to advanced dynamic programming techniques—can significantly improve performance. It provides a clear comparison between different approaches for solving the same problem efficiently.
