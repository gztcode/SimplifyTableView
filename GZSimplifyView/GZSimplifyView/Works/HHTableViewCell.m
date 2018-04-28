//
//  HHTableViewCell.m
//  GZWork
//
//  Created by Tim on 2018/3/17.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "HHTableViewCell.h"
#import "NSObject+GZModelAndClick.h"
#import "UIResponder+SubVIews.h"
#import "UIView+GZAdd.h"
#import "WBTimelineItem.h"
#import "UIImageView+YYWebImage.h"

@interface HHTableViewCell()
///ceshi
@property(nonatomic,strong) NSObject *obje;

@end

@implementation HHTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setGzModel:(WBStatus *)gzModel{
    
   
    self.contentView.gz_LabelLeft.text =gzModel.text;
    self.contentView.gz_LabelLeft.numberOfLines = 0;

    CGSize size =[self sizeForNoticeTitle:self.contentView.gz_LabelLeft.text font:self.contentView.gz_LabelLeft.font maxW:320];
    
    self.contentView.gz_LabelLeft.frame =CGRectMake(5, 5, 320, size.height);
    
    
    
    [self.contentView.gz_ImageViewCenter setImageWithURL:gzModel.thumbnailPic options:YYWebImageOptionUseNSURLCache];
    self.contentView.gz_ImageViewCenter.frame =CGRectMake(5, self.contentView.gz_LabelLeft.bottom+5, gzModel.sizeImage.width, gzModel.sizeImage.height);
    self.contentView.gz_ImageViewCenter.backgroundColor =[UIColor redColor];
    
    
    
    if (gzModel.gzCellHeightStr.intValue > 0) {
        return;
    }
    gzModel.gzCellHeightStr = @(self.contentView.getViewBottom).stringValue;

}
- (CGSize)sizeForNoticeTitle:(NSString*)text font:(UIFont*)font maxW:(CGFloat)maxW{

    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = CGSizeZero;
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    
    CGRect rect = [text boundingRectWithSize:maxSize
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    textSize = rect.size;
    
    return textSize;
}


@end
