# 概要

rake yardでdoc/file.*.htmlを作成した時に，うまくcodeがhighlight変換されない．

# 経過
8/3のゼミでerinjinuへ説明しているときに，俺のでは正常に変換されるのに，erijinuのmac上では変換されないことが判明

## rake yardでpreがうまく通らない理由
- 原因不明
- おれが，yardをいじっちゃったのかも．得にcodeの前後にpreをつけたような記憶が．．．
- ただそれがどこにあるのか不明．version変わってるので，消えてると思うんやけど．
- もう少し探してみます．

### 対策
とりあえず，wikiで登録するようにした．なんかしらんけど，直接あげられるし．

# 作業メモ
とりあえず，/usr/local/lib/ruby/gems/2.2.0/gems/yard-0.9.5で穴をほってみたが，お宝は，見当たらず．
## 原因コードの場所
```tcsh
lib/yard/templates/helpers/html_helper.rb:        html.gsub(/<pre\s*(?:lang="(.+?)")?>(?:\s*<code\s*(?:class="(.+?)")?\s*>)?(.+?)(?:<\/code>\s*)?<\/pre>/m) do
lib/yard/templates/helpers/html_helper.rb:          %Q{<pre class="#{classes}"><code class="#{language}">#{string}</code></pre>}

emacs lib/yard/templates/helpers/html_helper.rb


templates/default/tags/html/example.erb:      <pre class="example code"><code><%= html_syntax_highlight(tag.text) %></code></pre>
```
html_helper.rbに記述があるが，ちゃんと動いているようで，erijinuでなぜ動かないかが不明．erijinuでdebugが必要か．．．

## その他
```

bob% grep "<code" */*/*/*.*rb
spec/templates/helpers/html_helper_spec.rb:      expect(html).to match %r{^<p>Introduction:</p>.*<code class="ruby">}m
spec/templates/helpers/html_helper_spec.rb:      expect(subject.htmlify('<pre><code>def x; end</code></pre>', :html)).to eq(
spec/templates/helpers/html_helper_spec.rb:        '<pre class="code NAME"><code class="NAME">foobar</code></pre>')
spec/templates/helpers/html_helper_spec.rb:      expect(subject.htmlify("<pre><code>!!!LANG\ndef x; end</code></pre>", :html)).to eq(
spec/templates/helpers/html_helper_spec.rb:        '<pre class="code LANG"><code class="LANG">foobar</code></pre>')
spec/templates/helpers/html_helper_spec.rb:      expect(subject.htmlify('<pre lang="foo"><code>{"foo" => 1}</code></pre>', :html)).to eq(
spec/templates/helpers/html_helper_spec.rb:        '<pre class="code foo"><code class="foo">{&quot;foo&quot; =&gt; 1}</code></pre>')
spec/templates/helpers/html_helper_spec.rb:      expect(subject.htmlify('<pre lang="foo"><code>x = 1</code></pre>', :html)).to eq(
spec/templates/helpers/html_helper_spec.rb:        '<pre class="code foo"><code class="foo">x = 1</code></pre>')
spec/templates/helpers/html_helper_spec.rb:      expect(subject.htmlify('<pre><code class="foo">x = 1</code></pre>', :html)).to eq(
spec/templates/helpers/html_helper_spec.rb:        '<pre class="code foo"><code class="foo">x = 1</code></pre>')
[bob:2.2.0/gems/yard-0.9.5] bob% grep "<code" */*/*/*/*.*rb
spec/templates/helpers/markup/rdoc_markup_spec.rb:      expect(to_html('Hello +<code>+')).to eq '<p>Hello <tt>&lt;code&gt;</tt></p>'
spec/templates/helpers/markup/rdoc_markup_spec.rb:      expect(fix_typewriter("<code>Hello +hello+</code>")).to eq "<code>Hello +hello+</code>"

他のはspecばかり．
