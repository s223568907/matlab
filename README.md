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

## function [rt, Ans] = getKey(time)

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