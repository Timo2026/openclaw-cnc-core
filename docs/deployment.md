# 部署指南

## 系统要求

| 组件 | 最低要求 | 推荐配置 |
|------|---------|---------|
| Python | 3.8+ | 3.10+ |
| 内存 | 2GB | 4GB+ |
| 磁盘 | 1GB | 10GB+ |
| CPU | 2核 | 4核+ |

## 快速部署

### 1. 克隆仓库

```bash
git clone https://github.com/openclaw/openclaw-cnc-core.git
cd openclaw-cnc-core
```

### 2. 运行安装脚本

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

### 3. 配置

```bash
# 编辑配置文件
vi config/surface_pricing.json
vi config/material_pricing.json
vi config/machining_rules.json
```

### 4. 启动服务

```bash
# 激活虚拟环境
source venv/bin/activate

# 启动报价服务
python -m core.quote_engine
```

## Docker 部署

```bash
# 构建镜像
docker build -t openclaw-cnc-core:latest .

# 运行容器
docker run -d \
  -p 5000:5000 \
  -v $(pwd)/config:/app/config \
  -v $(pwd)/data:/app/data \
  openclaw-cnc-core:latest
```

## 与 OpenClaw Gateway 集成

在 OpenClaw 配置中添加：

```yaml
skills:
  - name: cnc-quote
    path: /path/to/openclaw-cnc-core
    runtime: python3.8
    entrypoint: core.quote_engine
```

## 生产环境建议

1. 使用 Gunicorn 或 uWSGI 部署 Flask 服务
2. 配置 Nginx 反向代理
3. 启用 HTTPS
4. 设置日志轮转
5. 配置监控告警

---

更多问题？查看 [FAQ](./faq.md) 或提交 [Issue](https://github.com/openclaw/openclaw-cnc-core/issues)