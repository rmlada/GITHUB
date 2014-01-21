//
//  Grid.h
//  prueba4
//
//  Created by rml on 23/12/13.
//  Copyright (c) 2013 rml. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Grid : UIView

@property (assign, nonatomic) CGFloat gridSpacing;
@property (assign, nonatomic) CGFloat gridLineWidth;
@property (assign, nonatomic) CGFloat gridXOffset;
@property (assign, nonatomic) CGFloat gridYOffset;
@property (strong, nonatomic) UIColor *gridLineColor;

@end
