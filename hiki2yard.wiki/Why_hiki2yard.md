# 概要

なぜ，hiki2yardを開発する必要が生じたかを概説．

## 状況

### 文書の強結合tight binding理論
文書はソースに近いところにおいておくべし．そうすれば，source codeをいじった時に，ちょっとしたコメントを残す気になる．

### 文書の対象者
rubyでprogramを開発する際には，gemとして配布することが最終目標となる．
したがって，そのための雛形が，

```
bundle gem [-b] gem_name
```

で自動再生される．そこで用意されている文書作成は開発者向けのyardがある．

他の多くの対象者むけに，一斉に作成したい．以下がその対象者の一覧．


|directory|format| for |対象者|
|:----|:----|:----|:----|
| hikis | hiki |hiki |自分|
| converter | hiki2md|
| gem_name.wiki | md | github|ユーザ（使用法）|
| converter |yard|
| doc | html | gem |開発者，あるいは改良者|
| converter |hiki2latex|
| docs | latex | 卒論，修論pdf | 学生，教授|


hiki2yardではこれらの文書作成を容易にするcommandを提供することを目的としている．
