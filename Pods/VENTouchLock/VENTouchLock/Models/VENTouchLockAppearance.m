#import "VENTouchLockAppearance.h"

@implementation VENTouchLockAppearance

- (instancetype)init
{
    self = [super init];
    if (self) { // Set default values
        _passcodeViewControllerTitleColor = [UIColor blackColor];
        _passcodeViewControllerCharacterColor = [UIColor blackColor];
        _passcodeViewControllerBackgroundColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:244/255.0f alpha:1.0f];
        _passcodeViewControllerShouldEmbedInNavigationController = NO;
        _cancelBarButtonItemTitle = NSLocalizedString(@"取消", nil);
        _createPasscodeInitialLabelText = NSLocalizedString(@"请输入密码", nil);
        _createPasscodeConfirmLabelText = NSLocalizedString(@"请再次输入密码", nil);
        _createPasscodeMismatchedLabelText = NSLocalizedString(@"Passwords did not match. Try again", nil);
        _createPasscodeViewControllerTitle = NSLocalizedString(@"Set Passcode", nil);
        _enterPasscodeInitialLabelText = NSLocalizedString(@"Enter your passcode", nil);
        _enterPasscodeIncorrectLabelText = NSLocalizedString(@"Incorrect passcode. Try again.", nil);
        _enterPasscodeViewControllerTitle = NSLocalizedString(@"Enter Passcode", nil);
        _splashShouldEmbedInNavigationController = NO;
        _touchIDCancelPresentsPasscodeViewController = NO;
        _navigationBarClass = [UINavigationBar class];
    }
    return self;
}

@end
