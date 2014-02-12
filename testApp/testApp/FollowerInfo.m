//
//  FollowerInfo.m
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import "FollowerInfo.h"
#import "ViewController.h"
#import "myCollectionCell.h"

@implementation FollowerInfo
@synthesize userProfileImage, userScreenName;

-(id)initWithTitle:(NSString *)names profileImages:(UIImage *)profileImages
{
    if ((self = [super init]))
    {
        userScreenName = names;
        userProfileImage = profileImages;
    }
    return self;
}

@end
