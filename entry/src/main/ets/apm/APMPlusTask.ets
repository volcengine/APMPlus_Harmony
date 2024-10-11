import BuildProfile from 'BuildProfile';
import { APMPlus, APMPlusBuilder } from '@volcengine/apmplus';
/**
 * @wangtao
 * @date 2024/3/13
 */
export class APMPlusTask {
  static initAPMPlus(context: Context) {
    APMPlus.init(context);
  }

  static startAPMPlus() {
    APMPlus.setDeviceId("");//可选，设置设备device_id，不设置会使用内部默认device_id，更新值随时调用。
    APMPlus.setUserId("");//可选，用户标识，没有默认值，更新值随时调用。

    let builder = new APMPlusBuilder("AppID", "AppToken"); //必填
    builder.debug = true; //可选，测试阶段配置有输出日志
    builder.channel = "channel"; //可选，渠道
    builder.startMonitor = true; //可选，是否开启启动监控
    builder.netMonitor = true;//可选，是否开启网络监控 后续需要使用HttpMonitor进行监控
    builder.versionCode = BuildProfile.VERSION_CODE; //可选，应用versionCode
    builder.versionName = BuildProfile.VERSION_NAME; //可选，应用versionName
    APMPlus.start(builder);
  }
}