//
//  Grid.m
//  prueba4
//
//  Created by rml on 23/12/13.
//  Modify by rml on 20/01/14
//  Copyright (c) 2013 rml. All rights reserved.
//

#import "Grid.h"

@implementation Grid

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Inicializacion código
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = self.gridLineWidth;
    
    CGFloat x = self.gridXOffset;
    while (x <= width)
    {
        [path moveToPoint:CGPointMake(x, 0.0)];
        [path addLineToPoint:CGPointMake(x, height)];
        x += self.gridSpacing;
    }
    
    CGFloat y = self.gridYOffset;
    while (y <= height)
    {
        [path moveToPoint:CGPointMake(0.0, y)];
        [path addLineToPoint:CGPointMake(width, y)];
        y += self.gridSpacing;
    }
    
    [self.gridLineColor setStroke];
    [path stroke];
}






#pragma mark - Métodos Privados

- (void)setDefaults
{
    //self.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = nil;
    //self.opaque = YES;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
    
    //self.gridSpacing = 20.0;
    self.gridSpacing = 40.0;
    
    if (self.contentScaleFactor == 2.0)
    {
        self.gridLineWidth = 0.5;
        self.gridXOffset = 0.25;
        self.gridYOffset = 0.25;
    }
    else
    {
        self.gridLineWidth = 1.0;
        self.gridXOffset = 0.5;
        self.gridYOffset = 0.5;
    }
    
    self.gridLineColor = [UIColor lightGrayColor];
}




@end
