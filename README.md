# 一些可能会用到的matlab函数
心理学matlab可供参考的函数和代码文件

## showPic(winPtr, winRect, picName, time)

用于展示图片。

- winPtr/winRect：通过命令`[winPtr, winRect] = Screen('OpenWindow', screenNumber, background)`获取的值。
- picName：需要展示的图片的路径，如`1.png`，类型为字符串。
- time：希望图片展示的时长（单位为秒），可以不传此参数表示呈现图片直至按下空格，类型为数字。