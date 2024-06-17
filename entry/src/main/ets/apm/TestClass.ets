import { hilog } from '@kit.PerformanceAnalysisKit'
import { systemDateTime } from '@kit.BasicServicesKit';
import { APMPlusAgent } from '@volcengine/apmplus';

export class TestClass {
  static crash() {
    InnerClass.crash();
  }

  static appFreeze() {
    let start = systemDateTime.getTime();
    while (start + 100 > systemDateTime.getTime()) {
      // hilog.info(0x0000, 'testTag', 'appFreeze');
    }
    TestClass.appFreeze2();
  }

  static appFreeze2() {
    let start = systemDateTime.getTime();
    while (start + 100 > systemDateTime.getTime()) {
      // hilog.info(0x0000, 'testTag', 'appFreeze');
    }
    TestClass.appFreeze();
  }

  static testEvent() {
    let category: object = new Object();
    category['version'] = "2.0";
    let metric: object = new Object();
    metric['key'] = 2
    let extra: object = new Object();
    extra['apm_extra'] = 'extra info'
    APMPlusAgent.monitorEvent("harmony", category, metric, extra);
  }
}

class InnerClass {
  static crash() {
    //数组越界
    let tempList = ['0', '1']
    hilog.info(0x0000, 'testTag', 'jsCrash %s', tempList[3].toString())
  }
}