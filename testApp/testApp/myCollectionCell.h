//
//  myCollectionCell.h
//  testApp
//
//  Created by Kevin O'Toole on 2/11/14.
//  Copyright (c) 2014 Kevin O'Toole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCollectionCell : UICollectionViewCell
{

}

@property (nonatomic, strong) IBOutlet UILabel *textLabel;
@property (nonatomic, strong) IBOutlet UIImageView *cellImageView;

-(void)resetWithLabel:(NSString*)labelText cellImage:(UIImage*)cellImage;

@end
