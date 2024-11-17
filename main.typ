#import "template.typ": *
#import "@preview/subpar:0.1.1"
#let my_config = (
    学号: "1234567890",
    姓名: "这里是姓名",
    专业: "这里是专业",
    日期: "2021年1月1日",
    地点: "这里是地点",
    课程名称: "这里是课程名称",
    实验名称: "这里是实验名称",
    指导老师: "甲乙丙",
    实验类型: "这里是实验类型",
    成绩: "100",
    同组学生姓名: "甲乙丙",
)

#show: zjuLabReport.with(config: my_config)

= 这里是一级标题
Typst 是一款基于 Rust 的新型排版语言，其实时性能和强大的排版功能使得它成为了一款非常优秀的排版工具。本模板针对常用排版需求进行封装。

== 如何插入图表？
=== 如何插入图片？
这里是一张图片：

#figure(
  image("figures/test.jpg", width: 30%),
  caption: "这里是图片标题",
)

如果你还想实现子图布局，可以使用 `subpar` 来实现，
#subpar.grid(
  figure(image("figures/test.jpg"), caption: [
    这里是子图 1 的标题
  ]), <a>,
  figure(image("figures/test.jpg"), caption: [
    这里是子图 2 的标题
  ]), <b>,
  columns: (1fr, 1fr),
  caption: [
    这里是整个图片的标题
  ],
  label: <figure_label>
)

如果你想对图片进行引用，可以使用 `@` 符号来实现，比如@figure_label 是整个图片的标签，而 @a 和 @b 是子图的标签。

=== 如何插入表格？

这里是一个表格：

#figure(
  table(columns: 3,
    [这里是表头 1], [这里是表头 2], [这里是表头 3],
    [这里是内容 1], [这里是内容 2], [这里是内容 3],
    [这里是内容 4], [这里是内容 5], [这里是内容 6],
  ),
  caption: "这里是表格标题",
)<常规表格>

@常规表格 是一个常规表格，如果你想使用三线表，可以像 @三线表 那样做：

#figure(
  table(columns: 3, stroke: none,
  toprule(),
    [这里是表头 1], [这里是表头 2], [这里是表头 3],
  midrule(),
    [这里是内容 1], [这里是内容 2], [这里是内容 3],
    [这里是内容 4], [这里是内容 5], [这里是内容 6],
  bottomrule(),
  ),
  caption: "这里是表格标题",
)<三线表>

== 如何插入公式？

行间公式使用 `$$` 符号，两边不加空格，比如：$a^2 + b^2 = c^2$ 是勾股定理。而行内公式同样使用 `$$` 符号，但是两边加空格，比如：
$ frac(diff  Psi  ^(\*),diff  t )Psi  + Psi  ^(\*)frac(diff  Psi  ,diff  t )&= - frac(i planck.reduce  ,2 m )lr(\( frac(diff  ^(2 ),diff  x ^(2 ))Psi  ^(\*)\) )Psi  + frac(i ,planck.reduce  )V Psi  ^(\*)Psi  - Psi  ^(\*)frac(i ,planck.reduce  )V Psi  + Psi  ^(\*)frac(i planck.reduce  ,2 m )lr(\( frac(diff  ^(2 ),diff  x ^(2 ))Psi  \) )\ &= - frac(i planck.reduce  ,2 m )lr(\( frac(diff  ^(2 ),diff  x ^(2 ))Psi  ^(\*)\) )Psi  + Psi  ^(\*)frac(i planck.reduce  ,2 m )lr(\( frac(diff  ^(2 ),diff  x ^(2 ))Psi  \) )\ &= frac(i planck.reduce  ,2 m )frac(diff  ,diff  x )lr(\( Psi  ^(\*)frac(diff  ,diff  x )Psi  - Psi  frac(diff  ,diff  x )Psi  ^(\*)\) )\ $<eq_typst>

#noindent() 式中，$planck.reduce$ 是普朗克常数。（我们可以使用`#noindent` 来取消缩进）

公式的引用同样使用`@` 符号，比如 @eq_typst 可以用来引用这个公式。

/* -------------------------------------------------------------------------- */
// 这里请忽略
#let TeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 1.7em, {
    [T]
    place(top, dx: 0.56em, dy: 0.22em)[E]
    place(top, dx: 1.1em)[X]
  })
}

#let LaTeX = {
  set text(font: "New Computer Modern", weight: "regular")
  box(width: 2.55em, {
    [L]
    place(top, dx: 0.3em, text(size: 0.7em)[A])
    place(top, dx: 0.7em)[#TeX]
  })
}
/* -------------------------------------------------------------------------- */

如果你习惯使用 #LaTeX 插入公式，那么你可以使用 `mitex` 来实现，比如：#mi[`\int_0^1 x \mathrm{d}x = \frac{1}{2}`] 是一个行内公式片段，而如果我想要输入行间公式，可以这样写：

#mitex(`
f(t)={\mathcal {L}}^{-1}\{F\}(t)={\frac {1}{2\pi i}}\lim _{T\to \infty }\int _{\gamma -iT}^{\gamma +iT}e^{st}F(s)\,\mathrm {d} s
`)<eq_tex>

#noindent() 同样，@eq_tex 可以用来引用这个公式。

或者你可以使用 #link("https://mitex-rs.github.io/mitex/")，或者#link("https://mitex-rs.github.io/mitex/", "mitex convertor") 来将 #LaTeX 公式转换为 Typst 公式。

