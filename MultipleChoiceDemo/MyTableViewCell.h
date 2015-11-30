//
//  MyTableViewCell.h
//  MultipleChoiceDemo
//
//  Created by LeeJay on 15/10/21.
//  Copyright © 2015年 以撒网. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyModel;

@protocol SelectReloadDelegate <NSObject>

- (void)cellForSelect:(BOOL)isSelect atIndexPath:(NSIndexPath *)indexPath;

@end


@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) MyModel *model;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIButton    *selectBtn;
@property (nonatomic, strong) UILabel     *title;

- (void)setBtnSelected:(BOOL)selected;

@property (nonatomic, weak) id<SelectReloadDelegate> delegate;

@end
