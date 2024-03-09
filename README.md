# KSU_MAGISK_TEMPLATE

KernelSU + Magisk 二合一模板

## 简介

这是个 KernelSU + Magisk 二合一模板，可以以它为基础构建模块

## 参考

[KSU 教程](https://kernelsu.org/zh_CN/guide/module.html)
[Magisk 教程](https://jesse205.github.io/MagiskChineseDocument/guides.html)

## 补充: KernelSU 和 Magisk 的异同

1. Magisk 支持在 rec 里安装，所以有`META-INF`文件夹, KernelSU 不支持所以没有
2. Magisk 有 Zygisk，所以有`zygisk`文件夹, KernelSU 不支持所以没有
3. Magisk 的`module.prop`支持`updateJson`特性
4. KernelSU 支持`post-mount.sh`和`boot-completed.sh`脚本, Magisk 不支持
5. KernelSU 支持 WebUI ，所以有`webroot`文件夹, Magisk 不支持所以没有
6. KernelSU 的`customize.sh`支持`REMOVE`特性, Magisk 不支持
