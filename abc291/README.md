# [ABC**CONTEST_NUMBER**](https://atcoder.jp/contests/abc**CONTEST_NUMBER**)

- [問題](https://atcoder.jp/contests/abc**CONTEST_NUMBER**/tasks)
- [提出](https://atcoder.jp/contests/abc**CONTEST_NUMBER**/submissions?f.User=Jessica_nao_)

## 2023/

### A

-

### B

-

### C

-

### D

- `9.times.each do |i|` で `i` が`0`から`n-1`までなの忘れがち
  - `1.upto(9).each {|i| pp i}`, `9.downto(1).each {|i| pp i}`, `(1..9).each {|i| pp i}` とかとの一覧欲しいね
- 最後にmod取るの忘れてWA貰ったの痛すぎ！
  - こういうのがあるから、先にModIntで定義したいよね〜泣

### E

- [Queue](https://rurema.clear-code.com/2.7.0/class/Thread=3a=3aQueue.html) を使う
- TSortがあるから使ってみたけど、TLEなってダメだったorz
  - TODO: この実装での計算量調べてみる（そもそも実装が適していない可能性ありそう）
- `q.size != 1` だったらNGの場所とか、 `while` の前では不要のこととか、考察もう少し丁寧にしたい気持ち！
- `arr.join(' ')` は、`arr * ' '` のほうが早いね
### F

-
