# 初心者向け 競プロに便利なメソッド集

## Array

### 配列同士の大小比較

[こちらを参照](https://zenn.dev/universato/articles/20201210-z-ruby#%E9%85%8D%E5%88%97%E3%81%A9%E3%81%86%E3%81%97%E3%81%AE%E5%A4%A7%E5%B0%8F%E6%AF%94%E8%BC%83)

Comparableモジュールをインクルードするだけで、配列どうしの大小比較をできるようになります。

```ruby
class Array
  include Comparable
end

[1, 2, 3] <= [1, 9, 9] #=> true
[1, 2, 3] >= [1, 2]    #=> true
```

### [Array#rotate!](https://docs.ruby-lang.org/ja/latest/method/Array/i/rotate=21.html)

```ruby
a = [ "a", "b", "c", "d" ]
a.rotate!        #=> ["b", "c", "d", "a"]
```

### [Array#minmax](https://docs.ruby-lang.org/ja/latest/method/Array/i/minmax.html)

```ruby
a = %w(albatross dog horse)
a.minmax                                 #=> ["albatross", "horse"]
a.minmax{|a,b| a.length <=> b.length }   #=> ["dog", "albatross"]
```

### [Array#*](https://docs.ruby-lang.org/ja/latest/method/Array/i/=2a.html)

整数か文字列かで挙動が異なる
後者の場合は、`self.join(sep)`に同じ

```ruby
[1, 2, 3] * 3  #=> [1, 2, 3, 1, 2, 3, 1, 2, 3]
[1,2,3] * "," #=> "1,2,3"
[1,2,3].join(",") #=> "1,2,3"
```

## String

### [String#chars](https://docs.ruby-lang.org/ja/latest/method/String/i/chars.html)

`self.each_char.to_a` に同じ

```ruby
"hello世界".chars #=> ["h", "e", "l", "l", "o", "世", "界"]
```

### [String#ord](https://docs.ruby-lang.org/ja/latest/method/String/i/ord.html)

- 文字列の最初の文字の文字コードを整数で返します
- `Integer#chr` で戻せる
- `String#chr` は、1文字目を返す

```ruby
'a'.ord #=> 97
97.chr #=> 'a'
'abcde'.chr #=> 'a'
```
