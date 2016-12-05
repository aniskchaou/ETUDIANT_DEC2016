//
//  CustomCell.m
//  projet_ios_1
//
//  Created by hichem on 11/27/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)updateCellWithTitle:(NSString*)name
{
    
    self.lab_name.text=name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
