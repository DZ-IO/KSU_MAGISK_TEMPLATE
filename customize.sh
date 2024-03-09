# 这个脚本将会在模块被解压后导入到当前 shell 中
# 如果你的模块需要根据设备的 API 版本或者设备构架做一些额外的操作
# 或者您需要为某些模块文件设置特殊权限/secontext，那可以写在这个脚本里
# 否则，请将此文件删除
ui_print "customize.sh demo"

SKIPUNZIP=1
# 设置上面的变量可以完全控制脚本的安装过程
# 此时，你需要自行处理所有安装过程（如解压模块，设置权限等）

ui_print "此脚本以“独立模式”运行在 Magisk / KernelSU 的 BusyBox ash shell 中。"
ui_print "以下是内置变量"
ui_print "此脚本是否运行在 KernelSU 环境下: $KSU"
ui_print "你可以通过它区分 Magisk。"
ui_print "KernelSU 当前的版本名字: $KSU_VER"
ui_print "KernelSU 用户空间当前的版本号: $KSU_VER_CODE"
ui_print "KernelSU 内核空间当前的版本号: $KSU_KERNEL_VER_CODE"
ui_print "当前安装的 Magisk 的版本字符串: $MAGISK_VER"
ui_print "注: KernelSU 中永远为 v25.2"
ui_print "当前安装的 Magisk 的版本代码: $MAGISK_VER_CODE"
ui_print "注: KernelSU 中永远为 25200"
ui_print "WARNING 不要通过这两个变量来判断是否是 KernelSU! "
ui_print "模块是否在 APP 中安装: $BOOTMODE"
ui_print "此变量在 KernelSU 中永远为 true, 因为 KernelSU 不支持在 recovery 中安装模块"
ui_print "当前模块的安装目录: $MODPATH"
ui_print "可以存放临时文件的目录: $TMPDIR"
ui_print "当前模块的安装包文件: $ZIPFILE"
ui_print "设备的 CPU 构架，有如下几种： arm, arm64, x86, or x64: "
ui_print "是否是 64 位设备: $IS64BIT"
ui_print "当前设备的 Android API 版本: $API"
ui_print "提示:您可以在 https://source.android.google.cn/docs/setup/about/build-numbers#platform-code-names-versions-api-levels-and-ndk-releases 找到所有 Android 版本对应的 API 级别"

#REMOVE="
#/system/app/YouTube
#/system/app/Bloatware
#"
# 对于kernelsu,可以在上面的变量中声明要删除的文件(夹),KernelSU会为你“删除”它
# ps: 这个引号的意思是实际不会删除，具体实现方式可以参见 https://kernelsu.org/zh_CN/guide/module.html#system-directories

# REPLACE="
# /system/app/YouTube
# /system/app/Bloatware
# "
# 您可以在上面的变量中声明要替换的文件夹，这样该文件夹内的文件将被完整替换而不是合并

# ui_print <msg>
#     打印 <msg> 到控制台
#     请避免使用“echo”，因为它不会显示在第三方 recovery 的控制台中

# abort <msg>
#     打印错误消息 <msg> 到控制台并终止安装
#     请避免使用“exit”，因为它会跳过终止清理步骤

# set_perm <target> <owner> <group> <permission> [context]
#     如果未指定 [context]，则默认值为“u:object_r:system_file:s0”
#     此函数是以下命令的简写：
#        chown owner.group target
#        chmod permission target
#        chcon context target

# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     如果未指定 [context]，则默认值为“u:object_r:system_file:s0”
#     此函数是以下psuedo代码的简写：
#       set_perm <directory> owner group dirpermission context
#       对于 <directory> 内的文件：
#         set_perm file owner group filepermission context
#       对于 <directory> 内的文件夹：
#         set_perm_recursive dir owner group dirpermission context
