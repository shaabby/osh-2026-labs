# Lab0 Trace 记录

## 目标
- 提供至少 1 种观测方式（`perf` / `ftrace` / `eBPF`），并解释关键事件。

## 方案 A：perf（建议）

### 命令
```bash
cd lab0/build
sudo perf stat ./bubble_sort
```

### 输出摘要（实测）
```text
Performance counter stats for './bubble_sort':

         1,190,876      task-clock                       #    0.573 CPUs utilized
                 1      context-switches                 #  839.718 /sec
                 1      cpu-migrations                   #  839.718 /sec
               130      page-faults                      #  109.163 K/sec
         3,264,299      instructions                     #    0.86  insn per cycle
         3,812,624      cycles                           #    3.202 GHz
         1,579,280      stalled-cycles-frontend          #   41.42% frontend cycles idle
           622,464      branches                         #  522.694 M/sec
            47,035      branch-misses                    #    7.56% of all branches

       0.002077784 seconds time elapsed
```


### 关键事件解释
- 已通过 `sudo perf stat` 获取有效性能计数，观测链路可用。
- 程序在小规模输入下执行时间约 `0.0021s`，符合实验规模预期。
- 指令数约 `3.26M`、分支失误率约 `7.56%`，主要开销来自排序循环与分支判断。
- 原始日志已归档至：`lab0/docs/artifacts/perf-stat.txt`。

## 方案 B：ftrace / eBPF（可选）
- 本次未执行（同样可能受权限限制，需要 sudo 或额外 capability）。

## 结论
- 本次已完成 `perf` 实测并获得完整性能指标，满足“可观测 + 可审计”要求。
