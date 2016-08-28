# TexManual

## teXShopの設定
1. 『設定』 $\rightarrow$ ︎書類 $\rightarrow$ ︎エンコーディング $\rightarrow$ Unicode(UTF-8)
1. 『設定プロファイル』$\rightarrow$ pTeX(ptex2pdf)を選択
1. TeXShopを再起動

## 必要なgemの確認
- gem listコマンドを入力,以下のgemが入っているか確認
  - hikidoc
  - hikiutils
- ︎︎無ければ(sudo) gem install hogehogeで入れる

## 入力の方法
- open -a mi hogehogeでファイルを開き,入力していく

## pdfファイルへの変換方法
1. hiki2latex hikis/hogehoge.hiki $>$ latexes/hogehoge.tex
```
(注意).hikiはhikisフォルダに,.texファイルはlatexesフォルダに入れてください
```
1. open hogehoge.tex
1. TeXShopが開く. 左上のタイプセットを押すとpdfファイルが出力される
