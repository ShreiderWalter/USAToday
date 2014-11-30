//
//  SimpleTableCellTableViewCell.h
//  USATODAY
//
//  Created by Admin on 24.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCellTableViewCell : UITableViewCell
@property(weak, nonatomic) IBOutlet UITextView * titleTextView;
@property(weak, nonatomic) IBOutlet UILabel * descriptionLabel;
@property(weak, nonatomic) IBOutlet UIImageView * thumbnailImageView;
@end
