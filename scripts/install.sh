#!/bin/bash
# OpenClaw CNC Core 快速部署脚本

set -e

echo "🦞 OpenClaw CNC Core 部署脚本"
echo "================================"

# 检查 Python 版本
PYTHON_VERSION=$(python3.8 --version 2>/dev/null || echo "not found")
if [[ "$PYTHON_VERSION" == *"3.8"* ]] || [[ "$PYTHON_VERSION" == *"3.9"* ]] || [[ "$PYTHON_VERSION" == *"3.10"* ]]; then
    echo "✅ Python 版本: $PYTHON_VERSION"
else
    echo "⚠️  请安装 Python 3.8+"
    exit 1
fi

# 创建虚拟环境
echo "📦 创建虚拟环境..."
python3.8 -m venv venv
source venv/bin/activate

# 安装依赖
echo "📥 安装依赖..."
pip install --upgrade pip
pip install -r requirements.txt

# 复制配置文件
echo "⚙️  配置文件..."
if [ ! -f "config/surface_pricing.json" ]; then
    cp config/examples/*.json config/
    echo "✅ 已复制示例配置到 config/"
fi

# 创建必要目录
mkdir -p logs database

echo ""
echo "✅ 部署完成！"
echo ""
echo "下一步："
echo "  1. 编辑 config/ 下的配置文件"
echo "  2. 运行测试: pytest tests/"
echo "  3. 启动服务: python core/quote_engine.py"