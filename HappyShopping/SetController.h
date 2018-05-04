//
//  SetController.h
//  HappyShopping
//
//  Created by rnd on 2017/8/29.
//  Copyright © 2017年 GoDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetView.h"

@interface SetController : UIViewController

//主要的scrollview
@property(strong,nonatomic)UIScrollView *mainScrollView;

@property(strong,nonatomic) SetView *setView;

@end
