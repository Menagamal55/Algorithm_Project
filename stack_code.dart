int minDifficultyStack(List<int> jobDifficulty, int d) {
  int n = jobDifficulty.length;
  if (n < d) return -1;

  // Base case: day 1
  List<int> prevDp = List.filled(n, 0);
  int maxVal = 0;
  for (int i = 0; i < n; i++) {
    maxVal = maxVal > jobDifficulty[i] ? maxVal : jobDifficulty[i];
    prevDp[i] = maxVal;
  }

  // Days 2 to d
  for (int day = 2; day <= d; day++) {
    List<int> currentDp = List.filled(n, 1 << 30);

    // Stack stores: index and minPrevDp
    List<Map<String, int>> stack = [];

    for (int i = day - 1; i < n; i++) {
      int minPrevDp = prevDp[i - 1];

      while (stack.isNotEmpty &&
          jobDifficulty[stack.last['index']!] <= jobDifficulty[i]) {
        minPrevDp =
            minPrevDp < stack.last['minPrevDp']!
                ? minPrevDp
                : stack.last['minPrevDp']!;
        stack.removeLast();
      }

      int currentTotal = jobDifficulty[i] + minPrevDp;

      if (stack.isNotEmpty) {
        currentTotal =
            currentTotal < currentDp[stack.last['index']!]
                ? currentTotal
                : currentDp[stack.last['index']!];
      }

      currentDp[i] = currentTotal;
      stack.add({
        'index': i,
        'minPrevDp': minPrevDp,
      });
    }

    prevDp = currentDp;
  }

  return prevDp[n - 1];
}
