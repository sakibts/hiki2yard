# Hiki2yard

bundle gemで作られるdirectoryに，hikiからyard, wiki文書を作る環境を自動構築する．

## 動機

| link | wiki | doc|
|:----|:----|:----|
| 動機 |[why?](Why_hiki2yard)|[why?](file.Why_hiki2yard.html)|


## インストール

以下のコマンドでgemとしてinstall:

```
$ gem install hiki2yard
```

## Usage

gemのdirectoryで

```
$ hiki2yard --init
```

と打ち込めば，自動的に環境を整備．

```
Usage: hiki2yard [options]
    -v                               show program Version.
    -f, --force                      force copy new Rakefile.
    -i, --init                       initialize target directory.
```

### 動作内容

1. Rakefileをcopy
1. .yardoptsファイルを作成
1. hikisディレクトリーを作成
1. wikiディレクトリーを作成
  1. Githubでwikiを作成してからgit clone ***.wiki.gitのほうが確実．

### directory構成
だいぶ省略しているし，また，.yardoptsなどの隠れファイルもあるが，
関連するdirectoryは以下のとおり．
```
.
├── CODE_OF_CONDUCT.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.txt
├── README.md
├── Rakefile
├── doc
│   ├── _index.html
├── hiki2yard.wiki
│   ├── Home.md
│   ├── README_en.md
│   ├── README_ja.md
│   └── Why_hiki2yard.md
├── hikis
│   ├── README_en.hiki
│   ├── README_ja.hiki
│   ├── README_ja.hiki~
│   └── Why_hiki2yard.hiki
└── latexes

13 directories, 46 files
```

## その後

1. hikisに適当にファイルを作成，編集
1. rake yardでdocumentsが自動生成される．

## やり残し

1. mathjax用のひな形との切り替え．
1. gemspecは手動で残した．
1. リンク作成をwikiとdocで自動生成したいな．．．
1. hiki2latexによるtex文書の自動生成．

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/daddygongon/hiki2yard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
