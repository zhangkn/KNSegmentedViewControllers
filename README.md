# KNSegmentedViewControllers:

#### A custom PageViewController for iOS with the tab bar control at the top


#### Example diagram

![image](https://wx1.sinaimg.cn/large/af39b376gy1fy7h5yfu0pj20ku112n3s.jpg)




# [Usage](https://github.com/zhangkn/KNSegmentedViewControllers/blob/master/KNSegmentedViewControllers/regNA/view/KNmasterRegView.m)

```
NSArray *tmp_itemArray = @[@"step1\n基本信息",@"step2\n信息",@"step3\n信息",@"step4\n照片"];

CGFloat leftEdg = 15;

CGFloat  tmptopButtonWidth = ([[UIScreen mainScreen] bounds].size.width-leftEdg*2)/tmp_itemArray.count;

CGFloat height = tmptopButtonWidth*(79/168.0);// 168/79 = w/h

TopButtonView  *tmp = [[TopButtonView alloc] initWithFrame:CGRectMake(leftEdg, leftEdg, [[UIScreen mainScreen] bounds].size.width-leftEdg*2, height) withTitleArray:tmp_itemArray];

```
