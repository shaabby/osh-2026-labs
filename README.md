# OSH 2026 labs

## 个人信息
- 学号：`PB24111620`
- 姓名：`刘亦航`

## 仓库说明
本仓库用于提交 USTC OSH 2026 课程实验。

- `lab0/`：实验零相关内容
- `lab0/linux.md`：Linux 设备信息与截图
- `lab0/markdown.md`：Markdown 基础练习（图片、代码块、Mermaid、LaTeX）
- `lab0/src/`：练习用资源文件（图片等）
- `lab0/verify_all.sh`：一键验证脚本（make/debug/clean/cmake/perf）
- `lab0/docs/`：实验零提交材料
- `lab0/docs/ai-log.md`：AI 过程日志
- `lab0/docs/verification.md`：测试/基准/复现说明
- `lab0/docs/trace.md`：trace 记录与事件解释
- `lab0/docs/risk-check.md`：风险与安全自检
- `lab0/docs/submission-checklist.md`：提交前核对清单

## Labs 提交要求说明

以下内容用于对齐 OSH labs 的提交规范，具体实验功能仍以课程发布的实验说明为准。

### 基本提交要求
- 代码改动应保持最小必要范围，并能说明关键设计决策。
- 对 AI 参与的关键改动，需提供可审计证据：测试/基准、trace、AI 过程日志。
- 若使用 agent，遵循“最小权限 + 可审计”原则。

### 建议一并提交的材料
- 测试/基准记录：至少 1 组新增测试或基准（建议两者都有）。
- trace 记录：至少 1 种（`eBPF` / `perf` / `ftrace`），并解释关键事件。
- AI 过程日志：包含 prompt/response 摘要、关键决策点、失败尝试与回滚。
- 风险自检：包含 prompt injection 与回归风险检查结论（附命令或工具输出摘要）。

### 提交前自检清单
- 功能正确且核心路径可复现。
- 新增测试可稳定通过。
- 结论可复现：环境、依赖、构建与运行命令齐全。
- 提交信息清晰：commit 描述能反映改动范围与实验目标。

### 实验零时间提醒
- 实验零截止时间：`2026-03-30`。
- 每位同学有 1 次延期 1 周机会，需在原截止日前联系助教申请。
