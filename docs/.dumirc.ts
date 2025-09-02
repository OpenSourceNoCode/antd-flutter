import {defineConfig} from 'dumi';
import {defineThemeConfig} from "dumi-theme-antd/dist/defineThemeConfig";

export default defineConfig({
  exportStatic:false,
  themeConfig: {
    ...defineThemeConfig({
      name: 'Antd Flutter Mobile',
      title: 'Antd Flutter Mobile',
      description: "Antd Flutter Mobile是 Ant Design Mobile 在 Flutter 平台的实现版本。零依赖、超轻量（整包仅 200k），50+ 高质量组件，覆盖主题，弹层、表单、列表精准定位等常见交互场景。",
      footer:false,
      github: 'https://github.com/OpenSourceNoCode/antd-flutter',
      nav: [
        {title: '指南', link: '/guide'},
        {title: '组件', link: '/components/antd-box'}
      ],
      bannerConfig:{
        showBanner:false
      },
      sidebarGroupModePath:true,
      docVersions: {
        "5.0.0 Alpha": 'https://github.com/OpenSourceNoCode/antd-flutter'
      },
      rtl:false,
      actions: [
        {
          type: 'primary',
          text: "开始使用",
          link: '/guide'
        },
        {
          type: 'default',
          text: "组件",
          link: '/components/antd-box'
        }
      ],
      features: [
        {title: '开箱即用', details: '零依赖，安装即完成'},
        {title: '样式系统', details: '创新式的样式系统，不绑定任何特定UI实现，灵活强大，允许你定制看到的每一个元素'},
        {title: '零依赖', details: '自包含解决方案，从弹窗到滚动交互，一个组件库满足所有需求。'},
        {title: '高性能', details: '深度优化滚动与底层实现，确保流畅体验与卓越性能表现。'},
        {title: '轻量级', details: '包含icon后整包仅218K'},
        {title: '暗黑模式', details: '基于 Antd Token 系统，不仅支持暗黑主题，更实现了完整设计体系的无缝贯通。'},
      ],
    }),
  },
});
