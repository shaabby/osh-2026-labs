# Lab0 AI 过程日志

## 任务目标
- 完成 `lab0` 必做项：冒泡排序代码、手写 Makefile 编译/清理能力。
- 完成选做项：条件编译 debug 输出与 CMake 构建。
- 补齐课程要求的提交材料文档。

## PIP 三段式记录

### Plan
- 功能目标：完成冒泡排序程序，支持普通构建、debug 构建与清理。
- 非功能目标：流程可复现、结果可观测、改动可审计。
- 风险识别：
	- `make` 默认入口与 `Makefile.old` 命名不一致风险。
	- `perf` 权限受限风险。
	- CMake 默认启用 `DEBUG_BUBBLE` 造成输出噪声风险。
- 可验证指标：`tests / perf / race / correctness`（详见 `verification.md`）。

### Implementation
- 实现 `main.cpp`、`bubblesort.cpp`、`bubblesort.hpp`。
- 手写 Makefile 保留为 `Makefile.old`，并支持 `all/debug/clean`。
- 新增 `verify_all.sh`，一键完成构建、运行、trace 与证据归档。

### Proof
- 自动化验证：`./verify_all.sh`。
- 最小复现：`make -f Makefile.old`、`make -f Makefile.old debug`、`cmake --build .`。
- 观测证据：`lab0/docs/trace.md` + `lab0/docs/artifacts/perf-stat.txt`。

## 使用模型与工具
- 模型：GPT-5.3-Codex
- 工具：VS Code Copilot、终端命令、`make -f Makefile.old`、CMake

## 关键 Prompt 摘要
- 要求将示例代码复制到 `lab0/` 并实现 `make` / `make clean`。
- 要求增加 `make debug`，每次交换后打印 vector。
- 要求按 OSH labs 提交规范补齐 `lab0` 提交材料。

## 关键 Response 摘要
- 生成 `main.cpp`、`bubblesort.cpp`、`bubblesort.hpp`。
- 手写 Makefile 已保留为 `Makefile.old`，支持 `all`、`clean`、`debug`。
- 在 `bubblesort.cpp` 中通过 `DEBUG_BUBBLE` 条件编译输出每次交换后的数组。
- 增加 `CMakeLists.txt`，在 `lab0/build` 可直接构建并运行。
- 增加提交材料文档：`docs/ai-log.md`、`docs/verification.md`、`docs/trace.md`、`docs/risk-check.md`、`docs/submission-checklist.md`。

## 关键决策点（含原因）
- 采用条件编译宏 `DEBUG_BUBBLE`，满足 debug 与 release 行为隔离。
- 采用最小改动策略，避免引入与实验目标无关的复杂结构。
- 选做 CMake 后将手写 Makefile 重命名为 `Makefile.old`，满足区分检查要求。

## 失败尝试与回滚
- 失败现象 1：在 `lab0/` 直接执行 `make`，报错 `No targets specified and no makefile found`。
- 原因分析：手写 Makefile 已按选做要求重命名为 `Makefile.old`。
- 处理方式：改为执行 `make -f Makefile.old` 与 `make -f Makefile.old debug`。
- 失败现象 2：`perf stat` 无法执行。
- 原因分析：系统 `perf_event_paranoid=4`，无 `CAP_PERFMON/CAP_SYS_ADMIN` 权限。
- 处理方式：先保留错误输出作为审计证据，后续改为 `sudo perf stat` 成功采集计数器并更新文档。

## 最终方案与权衡
- 最终方案：`Makefile.old` + 条件编译调试输出 + CMake 构建 + 提交材料文档。
- 权衡说明：在满足实验与检查要求的前提下，保持实现简洁、可复现、可审计。
