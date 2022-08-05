//
//  ATUIViewContainer.m
//  MyUIKit
//
//  Created by atom on 2022/8/5.
//
//

#import <UIKit/UIKit.h>
#import <MASConstraintMaker.h>
#import "ATUIViewContainer.h"
#import "View+MASAdditions.h"


@interface ATUIViewContainer()
@property (nonatomic, strong) UIStackView *colsView;
@property (nonatomic, strong) UILabel *titleView;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UIStackView *containerCols;

@end
@implementation ATUIViewContainer


- (instancetype)init {
    UILabel *empty = [[UILabel alloc] init];
    empty.text = @"View列表为空";
    self = [self initWithTitle:@"未命名" andContents:@[empty].copy];
    return self;
}

- (instancetype)initWithTitle:(NSString *)title andContents:(NSArray *)children {
    self = super.init;
    if(self){
        self.titleView.text = title;
        for(UIView *view in children){
            [self.containerCols addArrangedSubview:view];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets paddingContainer = UIEdgeInsetsMake(16, 16, 16, 16);
    [self addSubview:self.colsView];
    [self.colsView addArrangedSubview:self.titleView];
    [self.colsView addArrangedSubview:self.container];
    [self.container addSubview:self.containerCols];
    [self.colsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(paddingContainer);
    }];
    [self.containerCols mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(paddingContainer);

    }];
}

- (UIStackView *)colsView {
    if (_colsView == NULL) {
        _colsView = [[UIStackView alloc] init];
        _colsView.spacing = 10;
        _colsView.axis = UILayoutConstraintAxisVertical;
        _colsView.alignment = UIStackViewAlignmentCenter;
    }
    return _colsView;
}

- (UILabel *)titleView {
    if (_titleView == NULL) {
        _titleView = [[UILabel alloc]init];
        _titleView.textColor = [UIColor systemBlueColor];
    }
    return _titleView;
}

- (UIView *)container {
    if (_container == NULL) {
        _container = [[UIView alloc] init];
        _container.layer.borderColor = [[UIColor systemBlueColor] CGColor];
        _container.layer.borderWidth = 1;
        _container.layer.cornerRadius = 16;
    }
    return _container;
}

- (UIStackView *)containerCols {
    if (_containerCols == NULL) {
        _containerCols = [[UIStackView alloc] init];
        _containerCols.spacing = 10;
        _containerCols.axis = UILayoutConstraintAxisVertical;
    }
    return _containerCols;
}




@end
