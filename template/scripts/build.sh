#!/usr/bin/env bash
#
# build.sh — 将 src 目录打包为 dist/line-insight.zip
#
# 平台支持：
#   - macOS / Linux（原生 bash）
#   - Windows（Git Bash / WSL）
# Windows 原生 CMD / PowerShell 环境请改用同目录下的 build.bat
#
# 用法：
#   ./scripts/build.sh
#   （可从任意目录执行，脚本会自动定位项目根目录）
#
set -euo pipefail

# 定位脚本所在目录，保证从任意路径执行都能正确找到 src / dist
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$ROOT_DIR/src"
DIST_DIR="$ROOT_DIR/dist"
ZIP_NAME="line-insight.zip"
ZIP_PATH="$DIST_DIR/$ZIP_NAME"

# 依赖检查
if ! command -v zip >/dev/null 2>&1; then
  echo "❌ 未找到 zip 命令。" >&2
  echo "   请先安装：macOS 运行 'brew install zip'，Linux 运行 'sudo apt install zip'。" >&2
  echo "   （Windows 原生环境请改用 build.bat）" >&2
  exit 1
fi

# 源目录必须存在
if [ ! -d "$SRC_DIR" ]; then
  echo "❌ 未找到源目录：$SRC_DIR" >&2
  exit 1
fi

# 准备输出目录，并删除旧包避免内容叠加
mkdir -p "$DIST_DIR"
rm -f "$ZIP_PATH"

# 进入 src，将其中所有文件与子目录打包到 zip 根（不含 src 这一层目录名）。
# 排除 macOS 元数据与版本控制文件。
cd "$SRC_DIR"
zip -r "$ZIP_PATH" ./* -x '*.DS_Store' '__MACOSX/*' '.git/*' '.gitignore'

echo "✅ 打包完成：$ZIP_PATH"
echo "   压缩包内文件："
unzip -l "$ZIP_PATH"
