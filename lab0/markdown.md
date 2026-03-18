# Lab0 Markdown 练习

## 图片引用
下面是我喜欢的一张图片：

![favorite image](./src/Weixin%20Image_20260113130910_7_4.jpg)

## 代码块示例（Python）
```python
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("OSH"))
```

## Mermaid 流程图
```mermaid
flowchart TD
    A[开始] --> B{是否完成实验要求?}
    B -- 是 --> C[提交到仓库]
    B -- 否 --> D[继续完善内容]
    D --> B
    C --> E[结束]
```

## TeX / LaTeX 数学公式
我最喜欢的公式是欧拉恒等式：

$$
e^{i\pi} + 1 = 0
$$
