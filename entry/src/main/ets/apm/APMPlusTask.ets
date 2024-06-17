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
    let builder = new APMPlusBuilder("AppID", "AppToken"); //必填
    builder.debug = true; //可选，测试阶段配置有输出日志
    builder.channel = "channel"; //可选，渠道
    builder.startMonitor = true; //可选，是否开启启动监控
    builder.versionCode = BuildProfile.VERSION_CODE; //可选，应用versionCode
    builder.versionName = BuildProfile.VERSION_NAME; //可选，应用versionName
    builder.dynamicParams = {
      getDeviceId: () => {
        return ""; //可选，设备device_id，不返回会使用内部内置默认device_id.
      },
      getUserId: () => {
        return ""; //可选，用户标识，没有默认值。
      }
    }
    APMPlus.start(builder);
  }
}