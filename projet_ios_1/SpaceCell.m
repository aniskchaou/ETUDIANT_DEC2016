//
//  SpaceCell.m
//  projet_ios_1
//
//  Created by hichem on 11/27/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "SpaceCell.h"

@implementation SpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)updateCellWithTitle:(NSString*)name note: (NSString*)n coef:(NSString*)c
{   _notee=@"note: ";
    _coef=@"coef: ";
    
    self.lab_name.text=name;
    self.lab_note.text=[NSString stringWithFormat:@"%@ %@", _notee, n];
    self.lab_coeff.text=[NSString stringWithFormat:@"%@ %@", _coef, c];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
