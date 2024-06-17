import hilog from '@ohos.hilog';
import { TestClass } from '../apm/TestClass';
import testNapi from 'libnative_lib.so';


@Preview
@Entry
@Component
struct Index {
  @State message: string = 'APMPlus';
  @State buttonText: string = 'button';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button("event").margin({
          top: 10
        }).onClick(() => {
          TestClass.testEvent();
          hilog.info(0x0000, 'testTag', '%{public}s', 'index page click button');
        }).width('50%')
        Button("crash").margin({
          top: 10
        }).onClick(() => {
          TestClass.crash();
        }).width('50%')
        Button("freeze").margin({
          top: 10
        }).onClick(() => {
          TestClass.appFreeze();
        }).width('50%')
        Button("freeze2").margin({
          top: 10
        }).onClick(() => {
          TestClass.appFreeze2();
        }).width('50%')
        Button("native crash").margin({
          top: 10
        }).onClick(() => {
          testNapi.doCrash();
        }).width('50%')


      }
      .width('100%')
    }
    .height('100%')
  }
}