import { defineConfig } from "vitepress";

export default defineConfig({
  title: "WorkBuddy BI 教程",
  description: "面向非技术人员的 WorkBuddy + Excel BI 数据面板开发教程",
  lang: "zh-CN",
  base: "/workbuddy-bi-template/",
  lastUpdated: true,
  cleanUrls: true,
  vite: {
    server: {
      host: true
    }
  },
  themeConfig: {
    siteTitle: "WorkBuddy BI 教程",
    nav: [
      { text: "首页", link: "/" },
      { text: "教程", link: "/tutorial/00-概述" }
    ],
    sidebar: [
      {
        text: "教程",
        items: [
          { text: "00 · 概述", link: "/tutorial/00-概述" },
          { text: "01 · 准备", link: "/tutorial/01-准备" },
          { text: "02 · 创建项目", link: "/tutorial/02-创建项目" },
          { text: "03 · 搭建面板", link: "/tutorial/03-搭建面板" },
          { text: "04 · 验证与交付", link: "/tutorial/04-验证与交付" },
          { text: "05 · 常见问题", link: "/tutorial/05-常见问题" },
          { text: "附 · 主流模型对比", link: "/tutorial/06-模型对比" }
        ]
      }
    ],
    outline: {
      level: [2, 3],
      label: "本页目录"
    },
    docFooter: {
      prev: "上一页",
      next: "下一页"
    },
    lastUpdated: {
      text: "最后更新于"
    }
  }
});
