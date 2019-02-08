#import "BTUIKExtendedAddressFormField.h"
#import "BTUIKLocalizedString.h"

@implementation BTUIKExtendedAddressFormField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField.accessibilityLabel = BTUIKLocalizedString(EXTENDED_ADDRESS_LABEL);
        self.formLabel.text = BTUIKLocalizedString(EXTENDED_ADDRESS_LABEL);
        self.textField.placeholder = BTUIKLocalizedString(EXTENDED_ADDRESS_PLACEHOLDER);

        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.textField.returnKeyType = UIReturnKeyNext;
    }
    
    return self;
}

- (NSString *)extendedAddress {
    return self.textField.text;
}

- (BOOL)valid {
    if (self.isRequired) {
        return [self.extendedAddress stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet].length > 0;
    }
    else {
        return YES;
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return newText.length <= 255;
}

@end
