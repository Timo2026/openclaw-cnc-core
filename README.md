# OpenClaw CNC Core 🦞

> 基于 OpenClaw 的 CNC 智能报价系统核心框架

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-2026.3.3-green.svg)](https://github.com/openclaw/openclaw)

## ✨ 特性

- 🔧 **智能报价引擎** - 基于规则 + RAG 的混合决策系统
- 📐 **3D 图纸解析** - 支持 STEP/STP 文件，自动提取几何参数
- ⚠️ **风险控制** - 自动识别异常订单，触发人工审核
- 🔍 **历史案例检索** - 相似订单匹配，提升报价准确度
- 🚀 **OpenClaw 集成** - 无缝对接 QQ/邮件/飞书等多渠道

## 📦 版本说明

| 版本 | 特性 | 适用场景 |
|------|------|---------|
| **社区版 (免费)** | 报价引擎框架 + CAD 解析 + 示例配置 | 学习、二次开发、小型项目 |
| **商业版 (付费)** | 预训练模型 + 行业价格库 + 定制服务 | 生产环境、企业应用 |

### 社区版包含

```
openclaw-cnc-core/
├── core/                      # 核心模块
│   ├── quote_engine.py       # 报价引擎
│   ├── risk_control.py       # 风险控制
│   ├── step_2d_validator.py  # STEP 解析
│   ├── hybrid_retriever.py   # 混合检索器
│   └── case_retriever.py     # 案例检索
├── config/examples/           # 示例配置
├── docs/                      # 文档
└── scripts/                   # 部署脚本
```

### 商业版增强

| 功能 | 说明 |
|------|------|
| 🎯 **预训练模型** | 1200+ 真实报价数据训练，准确率 95%+ |
| 💰 **行业价格库** | 实时更新的材料价格、加工费率 |
| 🤖 **智能匹配** | 高级 RAG 检索，自动匹配历史案例 |
| 🔌 **一键部署** | Docker 镜像 + K8s 配置 |
| 📞 **技术支持** | 专属技术顾问，7x24 响应 |

## 🚀 快速开始

### 环境要求

- Python 3.8+
- OpenClaw Gateway (可选，用于多渠道接入)

### 安装依赖

```bash
pip install cadquery trimesh open3d flask numpy pandas scipy
```

### 基础使用

```python
from core.quote_engine import OpenClawQuoteEngine

# 初始化引擎
engine = OpenClawQuoteEngine(config_dir="./config/examples")

# 计算报价
order = {
    "order_id": "TEST-001",
    "material": "铝6061",
    "volume_cm3": 100,
    "area_dm2": 20,
    "quantity": 10,
    "surface_treatment": "阳极氧化",
    "machine_type": "3轴加工中心",
    "complexity": "中等"
}

result = engine.calculate_quote(order)
print(f"报价: ¥{result.total_price}")
```

### STEP 文件解析

```python
from core.step_2d_validator import validate_step_with_pdf

# 解析 STEP 文件
result = validate_step_with_pdf("part.STEP", "drawing.pdf")

print(f"尺寸: {result['step_data']['size_mm']}")
print(f"体积: {result['step_data']['volume']} cm³")
print(f"重量: {result['step_data']['weight']} kg")
```

## 📖 文档

- [部署指南](./docs/deployment.md)
- [API 文档](./docs/api.md)
- [配置说明](./docs/configuration.md)
- [二次开发](./docs/development.md)

## 🔗 与 OpenClaw 集成

本框架专为 [OpenClaw](https://github.com/openclaw/openclaw) 设计，可无缝接入：

- **QQ 机器人** - 自动接收图纸，返回报价
- **邮件系统** - 自动处理报价邮件
- **飞书/企业微信** - 审核通知、审批流程

```yaml
# openclaw 配置示例
skills:
  - name: cnc-quote
    path: ./openclaw-cnc-core
    config:
      api_endpoint: http://localhost:5000
```

## 💼 获取商业版

### 为什么选择商业版？

| 痛点 | 社区版 | 商业版 |
|------|--------|--------|
| 报价准确率 | 需自行训练 | 95%+ 开箱即用 |
| 价格数据 | 示例数据 | 实时行业价格 |
| 部署难度 | 手动配置 | 一键 Docker |
| 技术支持 | 社区论坛 | 专属顾问 |

### 联系我们

- 📧 Email: cnc@openclaw.ai
- 💬 QQ: 私聊咨询
- 🌐 官网: https://openclaw.ai/cnc

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

```bash
git clone https://github.com/openclaw/openclaw-cnc-core.git
cd openclaw-cnc-core
pip install -r requirements.txt
```

## 📄 许可证

- **社区版**: MIT License
- **商业版**: 商业授权，联系获取

---

<p align="center">
  <strong>OpenClaw CNC Core</strong> - 让 CNC 报价更智能 🦞
</p>

<p align="center">
  Made with ❤️ by <a href="https://github.com/openclaw">OpenClaw Team</a>
</p>