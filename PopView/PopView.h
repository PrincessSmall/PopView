//
//  PopView.h
//  PopView
//
//  Created by PrinceSmall on 2019/2/17.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef void(^completeBlock)(NSString *des, NSInteger i);

@interface PopView : UIView

@property (nonatomic, weak) completeBlock completeBlock;

+ (instancetype)showPopViewWithCompletion:(completeBlock)completeBlock;

@end

NS_ASSUME_NONNULL_END
