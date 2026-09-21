# WorkBuddy BI Dashboard Template

这是一个面向非技术人员的教程与模板仓库，用于演示如何基于 `WorkBuddy + Excel` 快速开发 BI 数据面板网页。

## 在线预览

点击查看在线文档站点（由 GitHub Pages 部署，push 到 `main` 分支后自动更新）：

**https://yang-0930.github.io/workbuddy-bi-template/**

## VitePress 支持

项目已接入 `VitePress`，文档站点入口位于 `docs/`。

常用命令：

```bash
npm install
npm run docs:dev      # 本地预览文档
npm run docs:build    # 构建静态站点
npm run docs:preview  # 预览构建产物
```

## 推荐做法

本项目建议采用“**Markdown 作为唯一源文件**，同时输出网页和 PDF”的方式维护：

- `Markdown`：主维护格式，最易迭代，适合版本管理
- `网页文档`：适合培训、互动演示、长期维护
- `PDF`：适合发给领导、归档、正式汇报

也就是说：

1. 平时只改 Markdown
2. 对外展示时生成网页
3. 需要汇报时导出 PDF

## 项目结构

```
workbuddy-bi-template/
├── docs/                 # 教程文档（VitePress 站点）
│   ├── .vitepress/       # 站点配置
│   ├── public/           # 站点静态资源（构建时原样发布）
│   │   ├── images/       # 教程图片
│   │   └── downloads/    # 可下载资源（模板 template.zip、示例 sales_data.xlsx）
│   ├── index.md          # 教程首页
│   └── tutorial/         # 教程正文（00 ~ 05，面向非技术人员）
├── examples/excel/       # 示例 Excel 数据
└── template/             # 代码模板（解压后即可作为新项目起点）
    ├── .codebuddy/       # AI 工程配置（规则）
    │   └── AGENTS.md     # 项目主指令，AI 自动加载
    ├── scripts/          # 打包脚本
    │   ├── build.sh      # macOS / Linux / Git Bash
    │   └── build.bat     # Windows 原生 CMD / PowerShell
    ├── src/              # 源码目录（放入 Vue3 页面与 vendor 依赖）
    └── dist/             # 打包产物（build 后生成 line-insight.zip）
```

## 技术栈

代码模板采用**免构建**方式，无需 Node.js 编译，浏览器直接打开即可运行：

- 前端：Vue3（`vue.global.js` 浏览器编译模式）
- 依赖引入：`src/vendor/` 本地加载（无 CDN 兜底，可离线运行）
- 打包：`scripts/build.sh` / `build.bat` 将 `src/` 打包为 `dist/line-insight.zip`

> Node.js 仅用于运行 VitePress 文档站点，与代码模板本身无关。

## 教程入口

- `docs/index.md`：教程首页
- `docs/tutorial/`：教程正文，按「概述 → 准备 → 创建项目 → 搭建面板 → 验证与交付 → 常见问题」步骤组织，一章一个文件，面向非技术人员

## 适合你的原因

- 教程主线完整，非技术人员可以直接按步骤走
- 代码模板预置了规则与打包脚本，开箱即用
- `examples/excel/` 提供示例数据，可立即跟着练
