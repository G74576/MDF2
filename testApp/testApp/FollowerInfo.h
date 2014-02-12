//
//  FollowerInfo.h
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowerInfo : NSObject
{
    UIImage *userProfileImage;
    NSString *userScreenName;
}

-(id)initWithTitle:(NSString*)names profileImages:(UIImage *)profileImages;

@property (nonatomic, strong) UIImage *userProfileImage;
@property (nonatomic, strong) NSString *userScreenName;

@end
