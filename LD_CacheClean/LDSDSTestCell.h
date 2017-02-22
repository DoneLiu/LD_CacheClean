//
//  LDSDSTestCell.h
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDSDSTestCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;

- (void)setUserInfoCellWithAvatar:(UIImage *)avatar;

@end
