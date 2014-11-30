//
//  SimpleTableCellTableViewCell.m
//  USATODAY
//
//  Created by Admin on 24.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "SimpleTableCellTableViewCell.h"

@implementation SimpleTableCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [_titleTextView setEditable:NO];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [_titleTextView setEditable:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
