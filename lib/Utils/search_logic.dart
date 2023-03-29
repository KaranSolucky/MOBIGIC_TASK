List SearchLogicList(List twoDList, String word, int r, int c) {
  List ind = [];
  int flag = 0;
  int wcount = 0;
  int wlen = word.length;
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (twoDList[i][j] == word[0]) {
        if (r - wlen >= i) {
          // for horizontal checking
          int inc = 0;
          int k;
          for (k = i; k < i + wlen; k++) {
            if (twoDList[k][j] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
          }
          if (flag == 1) {
            print("present");
            for (int l = i; l < k; l++) {
              print("Yo");
              ind.add((j * r) + l);
            }
            print(ind);
          } else {
            print("Not present");
          }
        }
        if (c - wlen >= j) {
          // for vertical checking
          int inc = 0;
          int k;
          for (k = j; k < j + wlen; k++) {
            if (twoDList[i][k] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
          }
          if (flag == 1) {
            print("present");
            for (int l = j; l < k; l++) {
              // print(l);
              // print(i);

              ind.add((l * r) + i);
            }
            print(ind);
          } else {
            print("Not present");
          }
        }

        if (c - wlen >= j && r - wlen >= i) {
          // for cross checking
          int inc = 0;
          int k;
          int m = i;
          for (k = j; k < j + wlen && m < i + wlen; k++) {
            if (twoDList[m][k] == word[inc]) {
              flag = 1;
              inc++;
            } else {
              flag = 0;
              break;
            }
            m++;
          }
          if (flag == 1) {
            print("present");
            int cnt = 0;
            for (int l = j; l < k; l++) {
              ind.add(((l * r) + i) + cnt);
              cnt++;
            }
            print(ind);
          } else {
            print("Not present");
          }
        }
      }
    }
  }
  return ind;
}
