# APMPlus Harmony 性能稳定性监控
## 一、简介
这是APMPlus Harmony SDK的demo项目。

火山引擎 APMPlus Harmony SDK，支持对Harmony OS Next平台的APP进行监控，可以查看线上真实用户的稳定性、性能、自定义埋点数据，帮助研发及时发现线上异常、定位排障，助力企业通过监控数据有效优化用户体验。
【APMPlus平台】https://www.volcengine.com/product/apmplus

## 二、APMPlus SDK 接入
### 2.1 创建产品
需要在火山引擎平台注册账号，然后在应用性能监控全链路版控制台创建应用。创建完成后可以在平台看到AppID、AppToken。具体的接入应用文档：https://www.volcengine.com/docs/6431/70797
产品创建后需要购买事件可以在平台查看上报数据，试用可以在火山平台联系在线客服，提供AppID申请免费试用额度。具体开通服务文档：https://www.volcengine.com/docs/6431/75599
### 2.2 集成SDK
通过 ohpm 安装APMPlus SDK。
```shell
ohpm i @volcengine/apmplus@latest
```
### 2.3 初始化SDK
SDK初始化需要尽早完成，建议在 AbilityStage 或者 Ability 的 onCreate 生命周期中。初始化代码参考如下：

```
    APMPlus.init(this.context);
    
    let builder = new APMPlusBuilder("AppID", "AppToken");//必填
    builder.debug = true;//可选，测试阶段配置有输出日志
    builder.channel = "volcengine";//可选，渠道
    builder.startMonitor = true;//可选，是否开启启动监控
    builder.versionCode = BuildProfile.VERSION_CODE;//可选，应用versionCode
    builder.versionName = BuildProfile.VERSION_NAME;//可选，应用versionName
    builder.dynamicParams = {
      getDeviceId: () => {
        return "device_id";//可选，设备device_id，不返回会使用内部内置默认device_id.
      },
      getUserId: () => {
        return "user_id";//可选，用户标识，没有默认值。
      }
    }
    APMPlus.start(builder);
```
详细接入文档：https://www.volcengine.com/docs/6431/1256322

## 三、更多信息
更详细的接入文档、功能介绍、最佳实践请参考【应用性能监控全链路版】 https://www.volcengine.com/docs/6431/69088 也可以在官网咨询在线客服获取更多支持。

