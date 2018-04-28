//
//  GZTableViewCell.m
//  GZWork
//
//  Created by Tim on 2018/2/26.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "GZTableViewCell.h"
#import "NSObject+GZModelAndClick.h"
#import "UIView+GZAdd.h"

@implementation GZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setGzModel:(NSObject *)gzModel{
    
}

-(void)setGzIndexPath:(NSIndexPath *)gzIndexPath{
    if (self.gzModel.gzCellHeight !=0) {
        return;
    }
    self.gzModel.gzCellHeight = [self.contentView getViewBottom];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
