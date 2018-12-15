
#define SingleH(name)\
+(instancetype)share##name;\
+(void)destroyInstance

#if __has_feature(objc_arc)
//ARC
#define SingleM(name) static id _instance;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(void)destroyInstance {\
_instance = nil;\
}\
\
+(instancetype)share##name\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance=[[self alloc] init];\
});\
return _instance;\
}\
\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
- (void)dealloc {\
    NSLog(@"%@:----释放了",NSStringFromSelector(_cmd));\
}

#else
//MRC
#define SingleM(name) static id _instance;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super allocWithZone:zone];\
});\
return _instance;\
}\
\
+(instancetype)share##name\
{\
return [[self alloc]init];\
}\
\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
-(oneway void)release\
{\
}\
-(instancetype)retain\
{\
    return _instance;\
}\
\
-(NSUInteger)retainCount\
{\
    return MAXFLOAT;\
}
#endif
