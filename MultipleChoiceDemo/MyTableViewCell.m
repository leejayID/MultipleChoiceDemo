//
//  MyTableViewCell.m
//  MultipleChoiceDemo
//
//  Created by LeeJay on 15/10/21.
//  Copyright © 2015年 以撒网. All rights reserved.
//

#import "MyTableViewCell.h"
#import "MyModel.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation MyTableViewCell
{
    BOOL isSelect;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        [self.contentView addSubview:self.title];
        
        self.selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 7, 30, 30)];
        [self.selectBtn setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
        [self.selectBtn addTarget:self action:@selector(onSelectBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selectBtn];
    }
    return self;
}

- (void)onSelectBtn
{
    isSelect = !isSelect;
    if ([self.delegate respondsToSelector:@selector(cellForSelect:atIndexPath:)]) {
        [self.delegate cellForSelect:isSelect atIndexPath:self.indexPath];
    }
}

- (void)setBtnSelected:(BOOL)selected
{
    if (selected){
        [_selectBtn setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    }else{
        [_selectBtn setImage:[UIImage imageNamed:@"unselected.png"] forState:UIControlStateNormal];
    }
}

- (void)setModel:(MyModel *)model
{
    isSelect = model.isCheck;
    self.title.text = model.name;
    [self setBtnSelected:model.isCheck];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
