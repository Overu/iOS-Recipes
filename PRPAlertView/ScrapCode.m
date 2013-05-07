/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
- (void)alertView:(UIAlertView *)alertView 
        willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if (alertView == self.offlineAlertView) {			
        if ([buttonTitle isEqualToString:PRPOKTitle]) {
            // ...
        } else if ([buttonTitle isEqualToString:PRPCancelTitle]) {
            // ...
        }
    } else if (alertView == self.serverErrorAlertView) {
        if ([buttonTitle isEqualToString:PRPTryAgainTitle]) {
            // ...
        }
    }
}

- (void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh"
                                    message:@"Something bad happened."
                                   delegate:self
                          cancelButtonTitle:PRPAlertButtonTitleRunAway
                          otherButtonTitles:PRPAlertButtonTitleOnward, nil];
    [alert show];
    [alert release];
}
- (void)alertView:(UIAlertView *)alertView 
        willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:PRPAlertButtonTitleAbort]) {
        [self runAway];
    } else if ([buttonTitle isEqualToString:PRPAlertButtonTitleOnward]) {
        [self proceedOnward];
    }
}

- (void)showAlert {
    [PRPAlertView showWithTitle:@"Uh Oh"
                        message:@"Something bad happened."
                    cancelTitle:PRPAlertButtonTitleAbort
                    cancelBlock:^(void) {
                        [self runAway]; 
                    }
                     otherTitle:PRPAlertButtonTitleOnward
                     otherBlock:^(void) {
                         [self proceedOnward];
                     }
     ];
}
