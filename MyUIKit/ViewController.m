//
//  ViewController.m
//  MyUIKit
//
//  Created by atom on 2022/8/4.
//
//

#import "ViewController.h"
#import "Masonry.h"
#import "ATUIViewContainer.h"

@interface ViewController ()
@property(nonatomic, strong) UIView *buttonArea;
@property (nonatomic, strong)UIView *labelArea;
@property (nonatomic, strong) UIView *textFieldArea;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UIKit组件";
    [self setup];
}

-(void)setup{
    //垂直滚动组件
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
    scrollView.alwaysBounceVertical = YES;
    //垂直组件
    UIStackView *colsView = [[UIStackView alloc] init];
    colsView.axis = UILayoutConstraintAxisVertical;
    //布局
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

    [scrollView addSubview:colsView];
    [colsView addArrangedSubview:self.buttonArea];
    [colsView addArrangedSubview:self.labelArea];
    [colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(self.view);
    }];

}


#pragma mark - 按钮 UIButton

- (UIView *)buttonArea {
    if(_buttonArea==NULL){
        _buttonArea = [[ATUIViewContainer alloc] initWithTitle:@"按钮 UIButton" andContents:self.genButtonsArray];
    }
    return _buttonArea;
}

-(NSArray *)genButtonsArray{
    //按钮
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *buttonConfigDic = @{
            @"borderedProminentButton":UIButtonConfiguration.borderedProminentButtonConfiguration,
            @"filledButton":UIButtonConfiguration.filledButtonConfiguration,
            @"borderedTinted":UIButtonConfiguration.borderedTintedButtonConfiguration,
            @"borderedButton":UIButtonConfiguration.borderedButtonConfiguration,
            @"plainButton":UIButtonConfiguration.plainButtonConfiguration,
            @"borderlessButton":UIButtonConfiguration.borderlessButtonConfiguration,
            @"grayButton":UIButtonConfiguration.grayButtonConfiguration,
            @"tintedButton":UIButtonConfiguration.tintedButtonConfiguration,
    };
    for(NSString* key in buttonConfigDic){
        UIButton *button = UIButton.new;
        UIButtonConfiguration *configuration = buttonConfigDic[key];
        configuration.title = key;
        button.configuration = configuration;
        [array addObject:button];
    }
    return array.copy;
}

#pragma mark - 按钮 UIButton

- (UIView *)labelArea {
    if(_labelArea==NULL){
        _labelArea = [[ATUIViewContainer alloc] initWithTitle:@"文本 UILabel" andContents:self.genLabelsArray];
    }
    return _labelArea;
}

-(NSArray *) genLabelsArray{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    label1.text = @"Label-1";
    label1.textColor = [UIColor whiteColor];//文本色彩
    label1.backgroundColor = [UIColor systemBlueColor];//背景色彩
    label1.shadowColor = [UIColor blackColor];//阴影色彩
    label1.shadowOffset = CGSizeMake(0, 4);//阴影偏移
    label1.font = [UIFont boldSystemFontOfSize:25];//字体大小
    label1.textAlignment = NSTextAlignmentCenter;//居中对齐
    label1.attributedText = [[NSAttributedString alloc] initWithString:@"hello"];
    [array addObject:label1];
    return array.copy;
}

@end
