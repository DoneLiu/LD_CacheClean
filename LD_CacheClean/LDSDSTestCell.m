//
//  LDSDSTestCell.m
//  LD_CacheClean
//
//  Created by Done.L (liudongdong@qiyoukeji.com) on 2017/2/22.
//  Copyright © 2017年 Done.L (liudongdong@qiyoukeji.com). All rights reserved.
//

#import "LDSDSTestCell.h"

@implementation LDSDSTestCell

- (void)setUserInfoCellWithAvatar:(UIImage *)avatar {
    self.avatar.image = avatar;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
