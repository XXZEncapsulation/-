//
//  CombinationModel.m
//  btn
//
//  Created by Jiayu_Zachary on 15/11/14.
//  Copyright © 2015年 Zachary. All rights reserved.
//

#import "CombinationModel.h"

@implementation CombinationModel {
    NSMutableArray *_usedArr;//识别
    NSMutableArray *_resultArr;//结果
    NSMutableArray *_needArr;//加入起点
    
    int _allCount;//总数
    int _myCount;//需要数
}

//初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    
    return self;
}

- (void)initData {
    _usedArr = [NSMutableArray array];
    _resultArr = [NSMutableArray array];
    _needArr = [NSMutableArray array];
}

#pragma mark - combination
/*
 _allCount 总数, _myCount 需要的数
 _allCount个元素中取出_myCount个元素的所有排列
 dataSource 数据源
 step 初始值 0
 */
- (void)perm:(int)step dataSource:(NSMutableArray *)dataSource{
    if (step == _allCount) {
        //获取第一组数据
        [_needArr addObject:[_resultArr mutableCopy]];
    }else {
        
        for (int i=0; i<_myCount; i++) {
            if (![_usedArr[i] intValue]) {
                //标识为1, 表明改元素在当前组合中已排列组合
                _usedArr[i] = @(1);
                //加入数据
                _resultArr[step] = dataSource[i];
                //递归下一层组合
                [self perm:(step+1) dataSource:dataSource];
                //一个循环后,重新下一次排列组合,重新标识为0
                _usedArr[i] = @(0);
            }
        }
    }
}

#pragma mark - setter
- (void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    
    if (_dataSource.count) {
        _allCount = _myCount = (int)_dataSource.count;
        
        //添加识别数据源
        for (int i=0; i<_allCount; i++) {
            [_usedArr addObject:@(0)];
        }
        
        //调用递归第0步
        [self perm:0 dataSource:_dataSource];
        
        if (_needArr.count) {
            [self setResultArr:_needArr];
        }
    }
}

//返回排列组合后的结果
- (void)setResultArr:(NSMutableArray *)resultArr {
    _resultArr = resultArr;
}

//加入起点
- (NSMutableArray *)addStartPointWithCoordinate:(NSDictionary *)coor {
    
    if (coor.count && _resultArr.count) {
        NSMutableArray *tempM = [NSMutableArray array];
        
        for (NSMutableArray *singleArr in _resultArr) {
            [singleArr insertObject:coor atIndex:0];
            [tempM addObject:singleArr];
        }
        
        return tempM;
    }
    
    return nil;
}

@end
