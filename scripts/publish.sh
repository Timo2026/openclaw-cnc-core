#!/bin/bash
# OpenClaw CNC Core 发布脚本
# 用于打包并上传到 GitHub / npm / PyPI

set -e

VERSION=${1:-"1.0.0"}
PACKAGE_NAME="openclaw-cnc-core"
BUILD_DIR="./dist"

echo "🦞 OpenClaw CNC Core 发布脚本"
echo "版本: $VERSION"
echo "================================"

# 清理旧构建
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

# 创建 tarball
echo "📦 打包中..."
tar -czvf $BUILD_DIR/${PACKAGE_NAME}-${VERSION}.tar.gz \
    --exclude='*.pyc' \
    --exclude='__pycache__' \
    --exclude='.git' \
    --exclude='*.db' \
    --exclude='logs/*' \
    --exclude='data/*' \
    --transform "s,^,${PACKAGE_NAME}-${VERSION}/," \
    core/ config/ docs/ scripts/ \
    README.md LICENSE requirements.txt package.json .gitignore

# 创建 zip (Windows 用户友好)
zip -r $BUILD_DIR/${PACKAGE_NAME}-${VERSION}.zip \
    core/ config/ docs/ scripts/ \
    README.md LICENSE requirements.txt package.json .gitignore \
    -x "*.pyc" -x "*/__pycache__/*" -x ".git/*"

echo ""
echo "✅ 打包完成!"
echo ""
echo "文件列表:"
ls -lh $BUILD_DIR/
echo ""
echo "下一步:"
echo "  1. GitHub: 创建 Release 并上传文件"
echo "  2. PyPI:  twine upload dist/${PACKAGE_NAME}-${VERSION}.tar.gz"
echo "  3. npm:   npm publish (如需发布到 npm)"