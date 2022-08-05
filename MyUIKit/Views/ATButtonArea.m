//
//  ATButtonArea.m
//  MyUIKit
//
//  Created by atom on 2022/8/6.
//
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ATUIViewContainer.h"
#import "ATButtonArea.h"

@implementation ATButtonArea

- (instancetype)init {
    self = [[ATUIViewContainer alloc] initWithTitle:@"按钮 UIButton" andContents:self.genButtonsArray];
    return self;
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

@end
