# [ABC290](https://atcoder.jp/contests/abc290)

- [問題](https://atcoder.jp/contests/abc290/tasks)
- [提出](https://atcoder.jp/contests/abc290/submissions?f.User=Jessica_nao_)

## 2023/03/31

### A

- [sum のこの使い方](https://atcoder.jp/contests/abc290/submissions/40170522) 知らなかった

### B

- [Numbered parameters](https://techtechmedia.com/numbered-parameters/) って、Ruby 2.7からの機能なのか！
  - 使っていこう🚀
- 文字列リテラルならぬ、文字リテラル初めて知った！
  - `?x`, `?o` は使っていく！
- [Ruby の shortest](https://atcoder.jp/contests/abc290/submissions/40171052) 更新できて嬉しい。笑
  - 改行コードが面倒だった😢

### C

- 何も考えられていなくて、WA貰ったの厳しすぎる泣
  - 与えられたサンプル以外に、次あたりでうまくいっていれば良いなと思ってテストした

```
3 3
0 0 1
```

```
1 1
0
```

```
1 1
3
```

### *D

- `n.gcd(d) == 1` のとき
  - `x += 1` の動き（2-ii）は考えないでも、全部のマスに行ってくれるからOK
- そうでないとき
  - gcd の数だけにグループ分けがされて、何番目のグループにいるかと、あと何回移動ができるかを考えればOK
    - グループのスタートは、いつも 0 -> 1 -> 2 -> ... って続くからわかりやすいね
- 余りと商を入れ替える感じだ！
- `puts` の後ろにloop置くの面白いから真似してみたけど、`do` `end` のときと、`{}` で挙動が変わるの意外だ
  - TODO: 調べる
  - [`{}`なら通るけど`do` `end`はだめ](https://atcoder.jp/contests/abc290/submissions/40394642)
- 結局、gcd = 1 なら、グループが1つになるだけだから、場合分けは不要だった

```
2
9 6 3
9 6 5
```

```
6
4
```

```
2
6 9 3
6 9 5
```

```
1
2
```

### E

- あ

### F

-
