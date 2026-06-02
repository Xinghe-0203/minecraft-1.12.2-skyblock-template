@echo off
chcp 65001 >nul
title 星空岛 Paper 1.12.2 服务器

REM 星空岛 Paper 1.12.2 启动脚本
REM 强制要求 Java 8 或 11，不支持 Java 17+

for /f "tokens=3" %%v in ('java -version 2^>^&1 ^| findstr /i "version"') do set "JAVA_VERSION=%%v"
REM 去除版本号中的引号（java -version 输出 "1.8.0_xxx" → 1.8.0_xxx）
set "JAVA_VERSION=%JAVA_VERSION:"=%"

REM 提取主版本号（如 1.8.0_xxx -> 1, 11.0.x -> 11, 17.0.x -> 17）
for /f "tokens=1,2 delims=." %%a in ("%JAVA_VERSION%") do (
    set "MAJOR=%%a"
    set "MINOR=%%b"
)

if "%MAJOR%"=="1" if "%MINOR%"=="8" goto :start
if "%MAJOR%"=="11" goto :start
if "%MAJOR%"=="1" if %MINOR% LSS 8 (
    echo [警告] 检测到 Java %JAVA_VERSION%，版本过低，可能存在兼容性问题，继续启动...
    goto :start
)

echo [警告] 检测到 Java %JAVA_VERSION%，Paper 1.12.2 官方仅支持 Java 8/11，部分插件可能不兼容，继续启动...

:start
REM 内存设置：10 人以下 2G，10-30 人 4G，30 人以上 6-8G
java -Xms2G -Xmx4G ^
     -XX:+UseG1GC ^
     -XX:MaxGCPauseMillis=50 ^
     -XX:+UnlockExperimentalVMOptions ^
     -XX:G1NewSizePercent=20 ^
     -XX:G1ReservePercent=20 ^
     -XX:G1MixedGCCountTarget=4 ^
     -XX:InitiatingHeapOccupancyPercent=15 ^
     -XX:G1MixedGCLiveThresholdPercent=90 ^
     -XX:SurvivorRatio=32 ^
     -XX:+PerfDisableSharedMem ^
     -XX:MaxTenuringThreshold=1 ^
     -jar paper-1.12.2.jar nogui

pause
