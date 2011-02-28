// RUN: %clang_cc1 -triple x86_64-apple-darwin10  -fobjc-nonfragile-abi  -emit-llvm -o - %s | FileCheck %s
// rdar://9048030

@interface Foo
+(id)alloc;
-(id)init;
-(id)self;
-(id)retain;
-(void)release;
-(id)autorelease;
@end

void test(void)
{
	[[[[[[Foo alloc] init] retain] autorelease] self] release];
}

// CHECK-NOT: call i8* (i8*, i8*, ...)* @objc_msgSend
