# Lab0 可验证性说明（测试/基准/复现）

## 0. 指标定义（按最新清单）
- `tests`：`./verify_all.sh` 全部步骤通过，脚本退出码为 `0`。
- `perf`：`perf stat` 输出包含 `task-clock`、`instructions`、`cycles`、`branch-misses`。
- `race`：本实验为单线程程序，不涉及共享可变状态并发访问，记为 `N/A`。
- `correctness`：普通构建、debug 构建、CMake 构建三种路径最终输出一致，均为 `11 12 22 25 34 64 90`。

## 1. 环境信息
- OS：Ubuntu 24.04.4 LTS
- 编译器：`g++ (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`

## 2. 构建与运行命令
```bash
cd lab0
make -f Makefile.old
./bubble_sort
```

实测输出（普通模式）：
```text
11 12 22 25 34 64 90
```

## 3. Debug 构建命令
```bash
cd lab0
make -f Makefile.old debug
./bubble_sort
```

实测行为（debug 模式）：
- 每次交换后输出一次数组状态。
- 最终输出为：`11 12 22 25 34 64 90`。

## 4. 清理命令
```bash
cd lab0
make -f Makefile.old clean
```

实测输出：
```text
rm -f main.o bubblesort.o bubble_sort
```

## 5. CMake 构建复现（选做）
```bash
cd lab0/build
cmake --build .
./bubble_sort
```

实测输出摘要：
```text
[100%] Built target bubble_sort
...（多行交换过程输出）...
11 12 22 25 34 64 90
```

## 6. 结果判定标准
- 普通模式：只输出排序后的序列。
- Debug 模式：每次交换后输出一次 `vector`，最终输出有序序列。
- 预期最终结果：`11 12 22 25 34 64 90`

## 7. 额外测试（可选）
- 输入空数组、单元素数组、已排序数组、逆序数组。
- 记录测试结果与结论。

## 8. 基准（可选）
- 已做轻量性能观测（`perf stat`，在 `lab0/build` 执行）：
	- `task-clock`: `1,190,876`
	- `instructions`: `3,264,299`
	- `cycles`: `3,812,624`
	- `branch-misses`: `47,035`（`7.56%`）
	- `time elapsed`: `0.002077784s`
- 证据文件：`lab0/docs/artifacts/perf-stat.txt`
- 说明：本数据用于提交证明与趋势参考，不代表大规模输入下的完整性能结论。

## 9. 自动化验证入口
```bash
cd lab0
./verify_all.sh
```

- 成功标准：终端输出 `All checks passed.`，并在 `lab0/docs/artifacts/` 生成日志文件。
