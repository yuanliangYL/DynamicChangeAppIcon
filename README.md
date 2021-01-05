# DynamicChangeAppIcon
动态修改app的icon demo

1. 配置icon
添加图片icon
动态修改的icon不能放在 Assets.xcassets 里，但是正常的主icon还是可以在这里设置的，也可以按下面的方法来设置；
首先，把需要修改的icon放在一个文件夹内.

2.配置info.plist
在info.plist中右键 -> Add Row ：
输入Icon... 会有提示，选择Icon files（iOS 5）
这里的Icon files（iOS 5）是个字典，其中可包含的Key值有CFBundlePrimaryIcon -> Primary Icon
CFBundleAlternateIcons
UINewsstandIcon -> Newsstand Icon
这里的Primary Icon是设置app的主icon，可以在这里的Icon files数组内添加，有多个的话，依次添加，也可以这里不用填写，直接在Assets.xcassets 里配置；
下面的Newsstand Icon，暂时用不到，不用管，也可以删除。
在 Icon files（iOS 5）内添加一个Key： CFBundleAlternateIcons ，类型为字典，在这个字典里配置我们所有需要动态修改的icon：键为icon的名称，值为一个字典（这个字典里包含两个键：CFBundleIconFiles，其值类型为Array，内容为icon的名称；UIPrerenderedIcon，其值类型为bool，内容为NO，也可以不加此key）

3.代码实现：参考demo

4.设置iPad动态图标
iPad的动态图标设置和上面步骤基本一样，有的文章说是将 CFBundleIcons 改为 CFBundleIcons~ipad

5.去掉更换icon时的弹框：hook presentViewController:animated:completion:方法，详见demo
