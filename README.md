# 一些可能会用到的matlab函数
心理学matlab可供参考的函数和代码文件。

默认已经完成页面初始化。

## showPic(winPtr, winRect, picName, time)

用于展示图片。

- winPtr/winRect：通过命令`[winPtr, winRect] = Screen('OpenWindow', screenNumber, background)`获取的值。
- picName：需要展示的图片的路径，如`1.png`，类型为字符串。
- time：希望图片展示的时长（单位为秒），可以不传此参数表示呈现图片直至按下空格，类型为数字。

使用案例

```matlab
screenNumber = 0;
background = 128;
[winPtr, winRect] = Screen('OpenWindow', screenNumber, background);
showPic(winPtr, winRect, '1.jpg');
showPic(winPtr, winRect, '1.png', 1);
```

## [rt, Ans] = getKey(time)

用于获取键盘按键和反应时。

默认按键为`F`和`J`，可以自行在函数内部修改。

默认按下`Q`会退出整个程序。

- rt：返回的反应时。
- Ans：返回的按键值，被试按下`F`则返回`1`，按下`J`则返回`0`，超时则返回`-1`。
- time：最长的反应时间，单位为毫秒。

使用案例

```matlab
[rt, ansA] = getKey(2000);
[~, ansB] = getKey(5000); // 只获取答案，不获取反应时
```

## [defAnswer] = initSubject()

用于录入被试信息。具体来说，会录入编号、性别和年龄。

调用了`check.m`文件，因而需要一起下载才能正常使用。

- defAnswer：长度为3的元胞数组，依次为编号、性别（`1`代表男性，`2`代表女性）和年龄，类型均为字符串。

使用案例

```matlab
defAnswer = initSubject();
id = defAnswer{1}; // 字符串
gender = defAnswer{2}; // 字符串，1代表男性，2代表女性
age = defAnswer{3}; // 字符串
```

## outIt(matrix, subjectid)

输出`matrix`数组到该被试对应的xlsx文件和总的xlsx文件。

- 生成的xlsx文件的名字为`subjectid_0_ans.xlsx`，如果该文件已存在，则会尝试`subjectid_1_ans.xlsx`、`subjectid_2_ans.xlsx`……以此类推。不会发生文件覆盖。
- 会在`total.xlsx`文件中保存当前的`matrix`，即能实现将所有被试的结果整合在一个xlsx文件中。
- `matrix`数组有第一行标题行作为数据的名称（如`subject age gender rt ans`）和没有时对应的代码不一样，需要修改（已注释）。

# 一些可能会用到的闲谈

## 实验室电脑和你的电脑

显然实验室电脑的matlab版本很旧。

- 有些本应自带的函数没有。解决方法是去你的matlab所在的文件夹里搜这个函数名的文件，然后和你的代码放到同一个文件夹下。原理是自带的函数其实就是matlab本身写好的函数，和你自己写的函数没有本质区别，无非放在了matlab的默认路径里你可以直接用。那么既然没有这个函数，就去把这个函数的源文件找出来。
- 旧版本matlab的字符串要用单引号。
- 由于上一条，`outIt.m`这个函数在实验室电脑上无法正常运行。正式实验时用`save('subjectid', 'matrix')`就行。

## 这个仓库为什么会存在

- 不要重复造轮子。
- 函数思想！一件事要做100遍的时候，就要想到把这件事拆成单独的函数来做。单独的函数方便差错，可以避免改了前面的代码忘了后面。
- 为了帮助大家快速完成某些不合理的要求。比如`outIt.m`在实际实验中根本没法用，`initSubject.m`也并没有必要写得这么复杂（到底哪个被试会在编号那里输入50个空格啊），那么它们为什么会存在呢……当某老师批你的实验心理学大作业的时候你就知道了。
- 阅读代码和抄代码是写代码的第一步，希望大家能在下载使用后阅读并完全弄懂本仓库中的代码，一定有助于对matlab编程的理解。
- 如果可能，欢迎你的添砖加瓦。可以发送邮件到s223568907@126.com。