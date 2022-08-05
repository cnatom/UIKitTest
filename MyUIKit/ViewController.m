//
//  ViewController.m
//  MyUIKit
//
//  Created by atom on 2022/8/4.
//
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property(nonatomic, strong) UIView *buttonArea;
@property (nonatomic, strong)UIView *labelArea;
@end

@implementation ViewController{
    BOOL _isOn;
}

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
#pragma mark - 容器
-(UIView *)viewsFromArray:(NSArray *)children title:(NSString *)title {
    UIEdgeInsets paddingContainer = UIEdgeInsetsMake(16, 16, 16, 16);
    UIView *superView = [[UIView alloc] init];
    //垂直容器
    UIStackView *colsView = [[UIStackView alloc] init];
    colsView.spacing = 10;
    colsView.axis = UILayoutConstraintAxisVertical;
    colsView.alignment = UIStackViewAlignmentCenter;
    //标题
    UILabel *titleView = UILabel.new;
    titleView.textColor = [UIColor systemBlueColor];
    titleView.text = title;
    //蓝色圆角容器
    UIView *container = UIView.new;
    container.layer.borderColor = [[UIColor systemBlueColor] CGColor];
    container.layer.borderWidth = 1;
    container.layer.cornerRadius = 16;
    //蓝色圆角容器-内部垂直布局
    UIStackView *containerCols = [[UIStackView alloc] init];
    containerCols.spacing = 10;
    containerCols.axis = UILayoutConstraintAxisVertical;

    //布局
    for (NSUInteger i = 0; i < children.count; ++i) {
        [containerCols addArrangedSubview:children[i]];
    }

    [superView addSubview:colsView];
    [colsView addArrangedSubview:titleView];
    [colsView addArrangedSubview:container];
    [container addSubview:containerCols];
    [colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(paddingContainer);
    }];
    [containerCols mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(paddingContainer);

    }];

    return superView;
}



#pragma mark - 按钮 UIButton

- (UIView *)buttonArea {
    if(_buttonArea==NULL){
        _buttonArea = [self viewsFromArray:self.genButtonsArray title:@"按钮 UIButton"];
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
        _labelArea = [self viewsFromArray:self.genLabelsArray title:@"文本 UILabel"];
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
