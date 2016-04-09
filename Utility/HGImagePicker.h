//
//  HGImagePicker.h
//  Hush
//
//  Created by Hiren on 10/23/15.
//  Copyright © 2015 Hush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HGImagePicker : NSObject

- (void)showImagePicker:(id)fromViewController withNavigationColor:(UIColor *)navigationColor imagePicked:(void(^)(UIImage * image))successBlock imageCanceled:(void(^)())cancelBlock;

@end