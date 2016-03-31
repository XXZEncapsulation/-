//
//  CombinationModel.h
//  btn
//
//  Created by Jiayu_Zachary on 15/11/14.
//  Copyright © 2015年 Zachary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CombinationModel : NSObject

/*!
    step1: 数据源, 不能为空
 */
@property (nonatomic, strong, nonnull) NSMutableArray *dataSource;

/*!
    step2: 返回结果
 */
@property (nonatomic, strong, nonnull) NSMutableArray *resultArr;

/*!
    step3: 加入起点
 */
- (nonnull NSMutableArray *)addStartPointWithCoordinate:(nonnull NSDictionary *)coor;

@end
