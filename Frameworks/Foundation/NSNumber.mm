//******************************************************************************
//
// Copyright (c) 2015 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************

#import "Starboard.h"
#import "Foundation/NSNumber.h"
#import "Foundation/NSString.h"
#import "CFFoundationInternal.h"
#import "NSCFNumber.h"
#import "NSNumberInternal.h"
#import "BridgeHelpers.h"

#import <limits>

@implementation NSNumber

+ (NSObject*)allocWithZone:(NSZone*)zone {
    if (self == [NSNumber class]) {
        static StrongId<NSNumberPrototype> prototype = [NSNumberPrototype allocWithZone:zone];
        return prototype;
    }

    return [super allocWithZone:zone];
}

// Ignore class_setSuperClass being 'deprecated'
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (void)load {
    // Now that NSNumber is loaded, go ahead and reset _NSCFNumber's and _NSCFBoolean's superclass
    // to be NSNumber. This is needed so that any CFNumber that was created *before*
    // NSNumber was loaded (namely all the constants in CF) will be properly bridged.
    class_setSuperclass(objc_getClass("_NSCFNumber"), self);
    class_setSuperclass(objc_getClass("_NSCFBoolean"), self);
}

#pragma clang diagnostic pop

/**
 @Status Interoperable
*/
- (instancetype)initWithCoder:(NSCoder*)coder {
    if ([coder containsValueForKey:@"NS.intval"]) {
        self = [self initWithInt:(int)[coder decodeIntForKey:@"NS.intval"]];
    } else {
        FAIL_FAST_HR_MSG(E_UNEXPECTED, "NSNumber initWithCoder with non-integer unsupported");
    }

    return self;
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithBool:(BOOL)num {
    return [[[self alloc] initWithBool:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithChar:(char)num {
    return [[[self alloc] initWithChar:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithDouble:(double)num {
    return [[[self alloc] initWithDouble:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithFloat:(float)num {
    return [[[self alloc] initWithFloat:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithInt:(int)num {
    return [[[self alloc] initWithInt:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithInteger:(NSInteger)num {
    return [[[self alloc] initWithInteger:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithLong:(long)num {
    return [[[self alloc] initWithLong:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithLongLong:(long long)num {
    return [[[self alloc] initWithLongLong:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithShort:(short)num {
    return [[[self alloc] initWithShort:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedChar:(unsigned char)num {
    return [[[self alloc] initWithUnsignedChar:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedInt:(unsigned int)num {
    return [[[self alloc] initWithUnsignedInt:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)num {
    return [[[self alloc] initWithUnsignedInteger:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedLong:(unsigned long)num {
    return [[[self alloc] initWithUnsignedLong:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)num {
    return [[[self alloc] initWithUnsignedLongLong:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)numberWithUnsignedShort:(unsigned short)num {
    return [[[self alloc] initWithUnsignedShort:num] autorelease];
}

/**
 @Status Interoperable
*/
+ (instancetype)zero {
    return [self numberWithInt:0];
}

/**
 @Status Interoperable
*/
+ (instancetype)one {
    return [self numberWithInt:1];
}

/**
 @Status Interoperable
*/
- (instancetype)initWithBool:(BOOL)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithChar:(char)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithDouble:(double)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithFloat:(float)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithInt:(int)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithInteger:(NSInteger)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithLong:(long)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithLongLong:(long long)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithShort:(short)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedChar:(unsigned char)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedInt:(unsigned int)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedInteger:(NSUInteger)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedLong:(unsigned long)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedLongLong:(unsigned long long)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (instancetype)initWithUnsignedShort:(unsigned short)num {
    // Derived classes are required to implement this initializer.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (BOOL)isEqual:(NSObject*)objAddr {
    if ([objAddr isKindOfClass:[NSNumber class]]) {
        return [self isEqualToNumber:(NSNumber*)objAddr];
    }
    return NO;
}

/**
 @Status Interoperable
*/
- (BOOL)isEqualToNumber:(NSNumber*)objAddr {
    return [self compare:objAddr] == 0;
}

#pragma region NSNumber compare Helpers
- (BOOL)_isUnsigned {
    return isupper([self objCType][0]);
}

- (BOOL)_isFloatingPoint {
    char objCTypeLowered = tolower([self objCType][0]);
    return (objCTypeLowered == 'f') || (objCTypeLowered == 'd');
}

template <typename TNumberType>
static NSComparisonResult _NSNumberCompare(TNumberType selfValue, TNumberType otherValue) {
    if (selfValue > otherValue) {
        return NSOrderedDescending;
    } else if (selfValue < otherValue) {
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
}

static NSComparisonResult _NSNumberCompareUnsignedSigned(unsigned long long unsignedValue, long long signedValue) {
    if (unsignedValue > LLONG_MAX) {
        return NSOrderedDescending;
    } else {
        return _NSNumberCompare(static_cast<long long>(unsignedValue), signedValue);
    }
}
#pragma endregion

/**
 @Status Interoperable
*/
- (NSComparisonResult)compare:(NSNumber*)other {
    if (other == self) {
        return NSOrderedSame;
    }

    if ([self _isFloatingPoint] || [other _isFloatingPoint]) {
        return _NSNumberCompare([self doubleValue], [other doubleValue]);

    } else {
        BOOL selfUnsigned = [self _isUnsigned];
        BOOL otherUnsigned = [other _isUnsigned];

        if (selfUnsigned && otherUnsigned) {
            return _NSNumberCompare([self unsignedLongLongValue], [other unsignedLongLongValue]);
        } else if (!selfUnsigned && !otherUnsigned) {
            return _NSNumberCompare([self longLongValue], [other longLongValue]);
        } else if (selfUnsigned && !otherUnsigned) {
            return _NSNumberCompareUnsignedSigned([self unsignedLongLongValue], [other longLongValue]);
        } else {
            return -_NSNumberCompareUnsignedSigned([other unsignedLongLongValue], [self longLongValue]);
        }
    }
}

/**
 @Status Interoperable
*/
- (id)copyWithZone:(NSZone*)zone {
    return [self retain];
}

/**
 @Status Interoperable
*/
- (BOOL)boolValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (char)charValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (double)doubleValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (float)floatValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (int)intValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (NSInteger)integerValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (long)longValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (long long)longLongValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (short)shortValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (unsigned char)unsignedCharValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (unsigned int)unsignedIntValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (NSUInteger)unsignedIntegerValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (unsigned long)unsignedLongValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (unsigned long long)unsignedLongLongValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (unsigned short)unsignedShortValue {
    // This class is a class cluster "interface".
    // A concrete implementation (default or derived) MUST implement this, if its objCType matches.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (NSDecimal)decimalValue {
    NSDecimal ret = {[self doubleValue] };
    return ret;
}

/**
 @Status Interoperable
*/
- (NSString*)stringValue {
    switch ([self objCType][0]) {
        case 'c':
            return [NSString stringWithFormat:@"%hhd", [self charValue]];
        case 'd':
            return [NSString stringWithFormat:@"%f", [self doubleValue]];
        case 'f':
            return [NSString stringWithFormat:@"%f", [self floatValue]];
        case 'i':
            return [NSString stringWithFormat:@"%d", [self intValue]];
        case 'l':
            return [NSString stringWithFormat:@"%ld", [self longValue]];
        case 'q':
            return [NSString stringWithFormat:@"%lld", [self longLongValue]];
        case 's':
            return [NSString stringWithFormat:@"%hd", [self shortValue]];
        case 'C':
            return [NSString stringWithFormat:@"%hhu", [self unsignedCharValue]];
        case 'I':
            return [NSString stringWithFormat:@"%u", [self unsignedIntValue]];
        case 'L':
            return [NSString stringWithFormat:@"%lu", [self unsignedLongValue]];
        case 'Q':
            return [NSString stringWithFormat:@"%llu", [self unsignedLongLongValue]];
        case 'S':
            return [NSString stringWithFormat:@"%hu", [self unsignedShortValue]];
        default:
            assert(0);
            return nil;
    }
}

/**
 @Status Interoperable
*/
- (const char*)objCType {
    // This class is a class cluster "interface". A concrete implementation (default or derived) MUST implement this.
    return NSInvalidAbstractInvocationReturn();
}

/**
 @Status Interoperable
*/
- (Class)classForCoder {
    return [NSNumber class];
}

/**
 @Status Interoperable
*/
- (NSString*)description {
    return [self stringValue];
}

/**
 @Status Caveat
 @Notes Doesn't take NSLocale into account.
*/
- (NSString*)descriptionWithLocale:(NSLocale*)locale {
    return [self description];
}

/**
 @Status Interoperable
*/
- (NSUInteger)hash {
    return [self unsignedIntegerValue];
}

/**
 @Status Interoperable
*/
- (void)getValue:(void*)dest {
    // This class is a class cluster "interface". A concrete implementation (default or derived) MUST implement this.
    NSInvalidAbstractInvocation();
}

- (CFNumberType)_cfNumberType {
    switch ([self objCType][0]) {
        case 'c':
            return kCFNumberCharType;
        case 'd':
            return kCFNumberDoubleType;
        case 'f':
            return kCFNumberFloatType;
        case 'i':
            return kCFNumberIntType;
        case 'l':
            return kCFNumberLongType;
        case 'q':
            return kCFNumberLongLongType;
        case 's':
            return kCFNumberShortType;
        case 'C':
            return kCFNumberSInt16Type;
        case 'I':
            return kCFNumberSInt64Type;
        case 'L':
            return kCFNumberSInt64Type;
        case 'Q':
            // kCFNumberSInt128Type = 17
            return static_cast<CFNumberType>(17);
        case 'S':
            return kCFNumberSInt32Type;
        default:
            assert(0);
            return kCFNumberIntType;
    }
}

@end

/**
 @Status Stub
*/
DWORD
NSDecimalCompare(NSDecimal* num1, NSDecimal* num2) {
    UNIMPLEMENTED();
    if (num1->val < num2->val) {
        return -1;
    } else if (num1->val > num2->val) {
        return 1;
    } else {
        return 0;
    }
}

/**
 @Status Stub
*/
DWORD NSDecimalAdd(NSDecimal* result, NSDecimal* left, NSDecimal* right, DWORD rounding) {
    UNIMPLEMENTED();
    result->val = left->val + right->val;
    return 0;
}

/**
 @Status Stub
*/
DWORD NSDecimalSubtract(NSDecimal* result, NSDecimal* left, NSDecimal* right, DWORD rounding) {
    UNIMPLEMENTED();
    result->val = left->val - right->val;
    return 0;
}

/**
 @Status Stub
*/
DWORD NSDecimalDivide(NSDecimal* result, NSDecimal* left, NSDecimal* right, DWORD rounding) {
    UNIMPLEMENTED();
    result->val = left->val / right->val;
    return 0;
}

/**
 @Status Stub
*/
DWORD NSDecimalMultiply(NSDecimal* result, NSDecimal* left, NSDecimal* right, DWORD rounding) {
    UNIMPLEMENTED();
    result->val = left->val * right->val;
    return 0;
}

/**
 @Status Stub
*/
DWORD NSDecimalIsNotANumber(NSDecimal* num) {
    UNIMPLEMENTED();
    if (num->val != num->val) {
        return TRUE;
    }
    return FALSE;
}

/**
 @Status Stub
*/
DWORD NSDecimalRound(NSDecimal* result, NSDecimal* num, int scale, DWORD rounding) {
    UNIMPLEMENTED();
    result->val = num->val;
    return 0;
}

/**
 @Status Stub
*/
NSString* NSDecimalString(NSDecimal* num, id locale) {
    UNIMPLEMENTED();
    char szVal[128];
    sprintf_s(szVal, sizeof(szVal), "%f", num->val);
    return [NSString stringWithCString:szVal];
}