# Lab0 风险与安全自检

## 1. Prompt Injection 风险检查
- 检查点：是否直接执行了不可信输入生成的命令。
- 本次结论：未直接执行来源不明或包含高风险副作用的命令。
- 证据（命令/输出摘要）：本次执行命令均为本地构建/运行类命令（`make -f Makefile.old`、`cmake --build .`、`./bubble_sort`、`sudo perf stat`），未涉及网络下载脚本、批量删除或仓库外写操作。

## 2. 回归风险检查
- 检查点：修改后普通构建与 debug 构建是否均可运行。
- 建议命令：
```bash
cd lab0
make -f Makefile.old && ./bubble_sort
make -f Makefile.old debug && ./bubble_sort
make -f Makefile.old clean
```
- 本次结论：检查通过。
- 证据摘要：
	- 普通模式输出：`11 12 22 25 34 64 90`
	- debug 模式：每次交换均有输出，最终同样输出 `11 12 22 25 34 64 90`
	- clean 输出：`rm -f main.o bubblesort.o bubble_sort`

## 3. 最小权限与可审计性
- 检查点：是否只改动必要文件，是否保留关键操作记录。
- 本次结论：满足。
- 说明：改动集中在 `lab0` 实验代码与 `lab0/docs` 提交材料，命令与结果均已写入文档，具备可追溯性。

## 4. 安全默认值落实
- 默认无写主分支：本次仅在本地工作区修改文件，未执行自动 push。
- 最小权限：构建与验证命令优先使用普通权限，仅在 trace 采集时使用 `sudo perf stat`。
- 审计留痕：构建、运行、trace 输出已归档到 `lab0/docs/artifacts/`。

## 5. 密钥与扫描检查
- pre-commit：当前环境未安装（`pre-commit not installed`）。
- 等价 secret scanning：已执行 `rg` 规则扫描（`AKIA|ASIA|BEGIN ... PRIVATE KEY|ghp_...|xox...`），未发现命中。
- 扫描命令（摘要）：
```bash
cd /home/user/code/osh
rg -n "AKIA|ASIA|BEGIN (RSA|EC|OPENSSH|DSA) PRIVATE KEY|ghp_[A-Za-z0-9]{36}|xox[baprs]-|-----BEGIN" lab0 README.md .github
```

## 6. 残余风险
- 例如：输入规模较大时，冒泡排序性能较差。
- 冒泡排序时间复杂度为 `O(n^2)`，数据规模增大时性能较差。
- CMake 构建当前默认启用 `DEBUG_BUBBLE`（`CMakeLists.txt` 中 `add_compile_definitions(DEBUG_BUBBLE)`），运行时会输出中间过程，可能影响性能与输出简洁性。
- `perf` 依赖 sudo 权限；在无 sudo 权限环境中，可能无法复现实测计数器结果。
