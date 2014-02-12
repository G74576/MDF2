//
//  myCollectionCell.m
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import "myCollectionCell.h"
#import "FollowerInfo.h"
@implementation myCollectionCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)resetWithLabel:(NSString*)labelText cellImage:(UIImage*)cellImage
{
    self.textLabel.text = [NSString stringWithFormat:@"@%@", labelText];
    self.cellImageView.image = cellImage;
}

@end
