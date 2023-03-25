# [ABC292](https://atcoder.jp/contests/abc292)

- [問題](https://atcoder.jp/contests/abc292/tasks)
- [提出](https://atcoder.jp/contests/abc292/submissions?f.User=Jessica_nao_)

## 2023/03/18, 2023/03/19

- このセット、Fが数学問題だったからかなりパフォ貰えそうで、（リハビリ終えた上で）リアタイで解きたかったなぁ〜という気持ちに！
  - と一瞬思ったが、Rubyで書いていたらE問題で絶対ペナってただろうから、そんなことないか😐
  - 引き続き精進頑張る🔥

### A

- 自然に解いても1行なの嬉しい！笑

### B

- `case`, `when` 自分では最近書いてなかった気がするから久々の登場

### C

- 約数の個数を先にカウントしておけば良い
  - めっちゃ見覚えのあるやつだ〜
    - この計算量が意外と少なくて済むの懐かしい……！

### D

- `map!(&:uniq!)` と、 `map!(&:uniq)` と、 `map(&:uniq!)` の比較、面白いかも！
  - （私が）通常やりたい！と思うであろうものは、3つ目で実現できる
  - と思ったけど、これ不要そうだった泣
- `has_seen = [false] * n` と、 `edges = Array.new(n) { Array.new(0) }` の差を再確認した
- とりあえずUnionFindで連結成分出しておいて、後から点の個数と線の個数数えるのが良さそうと思った
  - 計算量も足りている感じがするし
- `Array#inject` を使うときに、初期値を入れないとよくわからない挙動になった
  - 先頭の要素のループに入らない？
    - TODO: 確認する
- TODO: [ngtkanaさんの解説](https://atcoder.jp/contests/abc292/editorial/5942) の考え方で、私の実装の後半部分は大幅カットできるからやる
- UnionFind のメンテをした
  - メンバーも管理するように
  - [lib/union_find.rb](lib/union_find.rb) にファイルを作った
  - [まぐまぐの](https://github.com/magurofly/cp-library-rb/blob/main/%E3%83%87%E3%83%BC%E3%82%BF%E6%A7%8B%E9%80%A0/UnionFind.md) を参考にさせてもらった

### E

- 任意の点から、到達できる点全てに辺を引くようにすればok
- `Thread::Queue` 初めて使ってる！
  - `pop` が、空で実行したら勝手に止まってくれるのは良さそうだけど、`Thread.start` をしないといけないぽいね……？
    - だったら、普通に`empty?`か見てから進むほうが簡単かな
- `Queue#new` に引数入れられるのは、今のAtCoderのv2.7じゃダメだった〜！
  - 提出したら `ArgumentError` で落ちてガン萎え 😭
  - EasyTest の方は通ったから気づかなかった〜
    - コードテストで試すか、
    - TODO: 自分の手元のRubyのバージョンを合わせる必要があるね〜！

### F

- ただの数学問題で笑った
  - 完全に高校数学の三角関数じゃんね🤣
  - `sinθ`と`cosθ`を消すの懐かしい
- 長さの比が半端なく大きい時にだけ注意だ！
