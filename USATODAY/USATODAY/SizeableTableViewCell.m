//
//  SizeableTableViewCell.m
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "SizeableTableViewCell.h"

@implementation SizeableTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setFrame:(CGRect)frame{
    frame.size.height = 2 * frame.size.height;
    
    [super setFrame:frame];
}

@end
