# [ABC294](https://atcoder.jp/contests/abc294)

- [問題](https://atcoder.jp/contests/abc294/tasks)
- [提出](https://atcoder.jp/contests/abc294/submissions?f.User=Jessica_nao_)

## 2023/03/19, 2023/03/22

- 2022/05 以来の、リアタイ参加楽しかった！
  - 5完できたのはよかったけど、圧倒的準備不足でパフォーマンス悪くて悔しかった
  - ref: https://twitter.com/Jessica_nao_/status/1637468538427543556?s=20

### A

- filer と select はいつも悩むけど、[Enumerable#filter](https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/select.html)とか見てもよく分からん
- `Array#join` の デフォルト引数、空文字列だよな…？
  - なんで指定しないでも[通るの？](https://atcoder.jp/contests/abc294/submissions/39951511)

### B

- `Array#join` の デフォルト引数が、空文字列だから引数なしでOK

### C

- 全部ソートしてからマッピングするの賢い！
  - 別解で書き直した

### D

- そういえばRubyにも`SortedSet`あるじゃん！？って思って、試しに使ってみたらTLEでぴえん🥹
- 結局線形解じゃないときついのかもね
- Rubyで解いていることが急にバカらしくなってきた🤣

### E

-

### F

-
