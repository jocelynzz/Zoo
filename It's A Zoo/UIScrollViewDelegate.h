//
//  UIScrollViewDelegate.h
//  It's A Zoo
//
//  Created by Jocelyn on 1/16/15.
//  Copyright (c) 2015 Jocelyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIScrollViewDelegate <NSObject>
￼￼- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
@end
willDecelerate:(BOOL)decelerate

@interface UIScrollView : UIView
@property (assign) id <UIScrollViewDelegate> delegate;
@end

@end
