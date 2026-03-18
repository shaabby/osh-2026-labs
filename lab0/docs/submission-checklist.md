# Lab0 提交清单

## 必交文件（按当前仓库）
- [x] `lab0/main.cpp`
- [x] `lab0/bubblesort.cpp`
- [x] `lab0/bubblesort.hpp`
- [x] `lab0/Makefile.old`（手写 Makefile 备份）
- [x] `lab0/CMakeLists.txt`（若选择了 cmake 选做）
- [x] `lab0/linux.md`
- [x] `lab0/markdown.md`

## 提交材料（按课程 AI 要求）
- [x] `lab0/docs/ai-log.md` 已补全
- [x] `lab0/docs/verification.md` 已补全
- [x] `lab0/docs/trace.md` 已补全
- [x] `lab0/docs/risk-check.md` 已补全

## 提交前自检（按最新项目记忆）
- [x] Plan 完整：已写需求拆解（功能/非功能/风险）。
- [x] 指标明确：已定义 `tests / perf / race / correctness` 的通过标准。
- [x] 功能正确：核心路径可复现通过。
- [x] 测试通过：自动化脚本 `./verify_all.sh` 通过。
- [ ] 性能结论可信：当前仅小样本 perf 观测，未做多样本统计对比。
- [x] Proof 完整：自动化测试 + 最小复现 + trace/log 证据齐全。
- [x] 观测链路完整：trace 命令、环境、关键事件解释齐全。
- [x] AI 日志完整：包含失败尝试与回滚。
- [x] 安全默认值落实：默认无写主分支、最小权限、无自动 push。
- [x] 密钥与扫描检查：已执行等价 secret scanning（`rg`），未发现命中。
- [x] 安全自检完成：已说明 prompt injection 与回归风险控制方式。
- [x] 复现实验环境：已写系统版本、构建/运行命令。
- [x] 提交信息清晰：已提供建议 commit message。

## 提交前命令检查
```bash
cd lab0
make -f Makefile.old && ./bubble_sort
make -f Makefile.old debug && ./bubble_sort
make -f Makefile.old clean

cd build
cmake --build .
./bubble_sort
```

## 一次性验证脚本
```bash
cd lab0
./verify_all.sh
```

- 说明：脚本会一键执行 `make(old)`、`debug`、`clean`、CMake 构建与 `perf stat`，并将输出保存到 `lab0/docs/artifacts/`。
- 若当前环境不便执行 perf，可临时使用：`./verify_all.sh --skip-perf`。

## 提交说明（建议）
```bash
git add README.md lab0
git status
git commit -m "lab0: complete build/debug/cmake verification docs and trace"
git push
```

- 提交前确认 `lab0/docs/` 中 5 份材料均已补全。
- 若包含 `lab0/docs/artifacts/` 日志文件，可一并提交作为审计证据。

## 截止时间提醒
- Lab0 截止：`2026-03-30`
- 若需延期，需在原截止日前联系助教申请。
