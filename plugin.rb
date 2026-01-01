# name: discourse-baidu-tongji
# about: 百度统计集成插件
# version: 0.0.1
# authors: 徐晓伟 <xuxiaowei@xuxiaowei.com.cn>
# url: https://github.com/xuxiaowei-com-cn/discourse-baidu-tongji

enabled_site_setting :baidu_tongji_enabled

register_html_builder('server:before-head-close') do
  if SiteSetting.baidu_tongji_enabled && SiteSetting.baidu_tongji_site_id.present?
    <<~HTML
    <script>
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?#{SiteSetting.baidu_tongji_site_id}";
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(hm, s);
    })();
    </script>
    HTML
  end
end

