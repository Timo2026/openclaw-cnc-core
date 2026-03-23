# 更新日志

所有重要的更改都将记录在此文件中。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [1.0.0] - 2026-03-24

### 新增
- 智能报价引擎核心框架
- STEP/STP 3D 图纸解析模块
- 风险控制与人工审核流程
- 混合检索器 (规则匹配 + RAG)
- OpenClaw 多渠道集成支持
- 示例配置文件
- 部署脚本
- API 文档

### 特性
- 支持阳极氧化、镀锌、镀镍等 11 种表面处理识别
- 支持铝合金、不锈钢、铜合金等材料报价
- 自动提取 STEP 文件几何参数
- 低置信度订单自动转人工审核
- 与 OpenClaw Gateway 无缝集成

### 文档
- README.md - 项目介绍
- docs/deployment.md - 部署指南
- docs/api.md - API 文档

---

## 未来计划

### [1.1.0] - 计划中
- Docker 镜像支持
- Web UI 管理界面
- 更多 CAD 格式支持 (IGES, STL)

### [商业版]
- 预训练模型
- 行业价格数据库
- 高级 RAG 检索
- 定制化服务