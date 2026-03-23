# API 文档

## 报价 API

### POST /api/quote

计算订单报价

**请求体：**

```json
{
  "order_id": "ORD-001",
  "customer": "客户名称",
  "material": "铝6061",
  "volume_cm3": 100,
  "area_dm2": 20,
  "quantity": 10,
  "surface_treatment": "阳极氧化",
  "machine_type": "3轴加工中心",
  "complexity": "中等",
  "urgency": "标准交期"
}
```

**响应：**

```json
{
  "success": true,
  "order_id": "ORD-001",
  "quote": {
    "material_cost": 67.5,
    "machining_cost": 120.0,
    "surface_cost": 160.0,
    "total_price": 347.5
  },
  "confidence": 0.95,
  "requires_review": false
}
```

## STEP 解析 API

### POST /api/parse/step

解析 STEP 文件

**请求：** multipart/form-data

| 字段 | 类型 | 说明 |
|------|------|------|
| step_file | File | STEP 文件 |
| pdf_file | File | PDF 图纸 (可选) |

**响应：**

```json
{
  "success": true,
  "geometry": {
    "length": 100.0,
    "width": 50.0,
    "height": 25.0,
    "volume": 125.0,
    "weight": 0.338
  },
  "comparison": {
    "is_consistent": true,
    "warnings": []
  }
}
```

## 审核 API

### GET /api/review/pending

获取待审核任务列表

### POST /api/review/{task_id}/approve

批准审核任务

### POST /api/review/{task_id}/reject

拒绝审核任务

---

完整 API 文档请访问：http://localhost:5000/docs