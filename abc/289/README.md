# [ABC289](https://atcoder.jp/contests/abc289)

- [問題](https://atcoder.jp/contests/abc289/tasks)
- [提出](https://atcoder.jp/contests/abc289/submissions?f.User=Jessica_nao_)

## 2023/04/08

### A

- [`String#tr`](https://docs.ruby-lang.org/en/3.2/String.html#method-i-tr) 知らなかった！挙動も面白い！

### B

- ぱっと見B問題じゃない気がしたけど、n <= 100 だからか？
- Rubyの中での最速を取ろうとしたけど、無理だった。笑
- `Array#flat_map` を競プロで使うの初めてだと思う😎

### C

- [abc293/c.rb](../abc293/c.rb)で出てるbit全探索だ！
- TODO: `Array#combination` 使った回答も作る
- `0..10` と `0...10` の違いは、前者だけが10を範囲に含むこと

## 2023/04/12

### D

- abc297のEじゃない？？？😱
  - これを精進でやっていたらシュッと解けたかもしれない。。。
  - と思ったが、`x < 10**5` の制約があるから、そこまで全部の到達できる or できないを管理すればいいのか
    - 別にabc297 E と同様に解けるからそうした
    - 想定はやっぱりDPだった！
- 既に見た数を再利用するとTLEになるのは非自明だと感じた
  - C++だとこれでも通るかな？
- [この提出について、](https://atcoder.jp/contests/abc289/submissions/40574711)本当は、`unavairable[i]` を使わないといけないけど、 `unavairable[x] = false` だからでも大丈夫だった

## 2023/04/15

### E*

- BFS
  - ダイクストラとの共通点、違い、実装を、完全に理解した
- 解説にある通り、 ABC235 D, ABC272 Dを先に解いてきた
  - 上2問ができていれば、解ける問題だね
- `debug` という関数を `pp` するように用意しているが、大きな配列を渡すとすぐTLEなるから気をつけねば…！

### F

-
