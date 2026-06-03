#!/bin/bash
# 星空岛 Paper 1.12.2 启动脚本
# 强制要求 Java 8/11，不支持 Java 17+

JAVA_VER=$(java -version 2>&1 | head -1 | awk -F '"' '{print $2}' | awk -F '.' '{ if ($1==1 && $2==8) print "OK"; else if ($1==11) print "OK"; else if ($1==1 && $2<8) print "OLD"; else print "NEW" }')

if [ "$JAVA_VER" = "OLD" ]; then
    echo "[警告] 检测到 Java 8 以下版本，可能存在兼容性问题，继续启动..."
fi

if [ "$JAVA_VER" = "NEW" ]; then
    JAVA_MAJOR=$(java -version 2>&1 | head -1 | awk -F '"' '{print $2}' | awk -F '.' '{print $1}')
    echo "[警告] 检测到 Java $JAVA_MAJOR，Paper 1.12.2 官方仅支持 Java 8/11。部分插件可能不兼容，继续启动..."
fi

# 内存设置：
#   -Xms  初始堆内存（建议与最大值相同避免动态调整）
#   -Xmx  最大堆内存
# 根据玩家规模调整：10 人以下 2G，10-30 人 4G，30 人以上 6-8G
# G1GC 配合 4G+ 堆可显著降低卡顿
java -Xms2G -Xmx4G \
     -XX:+UseG1GC \
     -XX:MaxGCPauseMillis=50 \
     -XX:+UnlockExperimentalVMOptions \
     -XX:G1NewSizePercent=20 \
     -XX:G1ReservePercent=20 \
     -XX:G1MixedGCCountTarget=4 \
     -XX:InitiatingHeapOccupancyPercent=15 \
     -XX:G1MixedGCLiveThresholdPercent=90 \
     -XX:SurvivorRatio=32 \
     -XX:+PerfDisableSharedMem \
     -XX:MaxTenuringThreshold=1 \
     --add-opens java.base/java.lang=ALL-UNNAMED \
     --add-opens java.base/java.lang.reflect=ALL-UNNAMED \
     --add-opens java.base/java.net=ALL-UNNAMED \
     -jar paper-1.12.2.jar nogui
