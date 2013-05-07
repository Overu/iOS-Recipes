/***
 * Excerpted from "iOS Recipes",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/cdirec for more book information.
***/
//
//  PRPMultipartPOSTRequest.m
//  MultipartHTTPPost
//
//  Created by Matt Drance on 9/21/10.
//  Copyright 2010 Bookhouse Software, LLC. All rights reserved.
//

#import "PRPMultipartPOSTRequest.h"

@interface PRPUploadFileInfo : NSObject {}

@property (nonatomic, copy) NSString *localPath;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy) NSString *nameParam;
@property (nonatomic, copy) NSString *fileName;

@end

@interface PRPMultipartPOSTRequest ()

- (NSString *)preparedBoundary;

- (void)startRequestBody;
- (NSInteger)appendBodyString:(NSString *)string;
- (void)finishRequestBody;

- (void)finishMediaInputStream;
- (void)handleStreamCompletion;
- (void)handleStreamError:(NSError *)error;

@property (nonatomic, copy) NSString *pathToBodyFile;
@property (nonatomic, retain) NSOutputStream *bodyFileOutputStream;

@property (nonatomic, retain) PRPUploadFileInfo *fileToUpload;
@property (nonatomic, retain) NSInputStream *uploadFileInputStream;

@property (nonatomic, copy) PRPBodyCompletionBlock prepCompletionBlock;
@property (nonatomic, copy) PRPBodyErrorBlock prepErrorBlock;

@property (nonatomic, assign, getter=isStarted) BOOL started;
@property (nonatomic, assign, getter=isFirstBoundaryWritten) BOOL firstBoundaryWritten;

@end


@implementation PRPMultipartPOSTRequest

@synthesize HTTPBoundary;

@synthesize formParameters;
@synthesize fileToUpload;
@synthesize uploadFileInputStream;

@synthesize pathToBodyFile;
@synthesize bodyFileOutputStream;

@synthesize prepCompletionBlock;
@synthesize prepErrorBlock;

@synthesize started;
@synthesize firstBoundaryWritten;

- (void)dealloc {
    [HTTPBoundary release], HTTPBoundary = nil;
    [formParameters release], formParameters = nil;
    [fileToUpload release], fileToUpload = nil;
    [uploadFileInputStream release], uploadFileInputStream = nil;
    [pathToBodyFile release], pathToBodyFile = nil;
    [bodyFileOutputStream release], bodyFileOutputStream = nil;
    [prepCompletionBlock release], prepCompletionBlock = nil;
    [prepErrorBlock release], prepErrorBlock = nil;
    
    [super dealloc];
}

- (void)setUploadFile:(NSString *)path
          contentType:(NSString *)type
            nameParam:(NSString *)nameParam
             filename:(NSString *)fileName {
    PRPUploadFileInfo *info = [[PRPUploadFileInfo alloc] init];
    info.localPath = path;
    info.fileName = fileName;
    info.nameParam = nameParam;
    info.contentType = type;
    
    self.fileToUpload = info;
    
    [info release];
}

#pragma mark -
#pragma mark Request body preparation
- (void)startRequestBody {
    if (!self.started) {
        self.started = YES;
        
        [self setHTTPMethod:@"POST"];
        NSString *format = @"multipart/form-data; boundary=%@";
        NSString *contentType = [NSString stringWithFormat:format,
                                 self.HTTPBoundary];
        [self setValue:contentType forHTTPHeaderField:@"Content-Type"];
        
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef uuidStr = CFUUIDCreateString(kCFAllocatorDefault, uuid);
        NSString *extension = @"multipartbody";
        NSString *bodyFileName = [(NSString *)uuidStr
                                  stringByAppendingPathExtension:extension];
        CFRelease(uuidStr);
        CFRelease(uuid);        

        self.pathToBodyFile = [NSTemporaryDirectory()
                               stringByAppendingPathComponent:bodyFileName];
        NSString *bodyPath = self.pathToBodyFile;
        self.bodyFileOutputStream = [NSOutputStream
                                     outputStreamToFileAtPath:bodyPath
                                                       append:YES];
        
        [self.bodyFileOutputStream open];
    }
}

- (void)finishRequestBody {
    [self appendBodyString:[NSString stringWithFormat:@"\r\n--%@--\r\n", self.HTTPBoundary]];
    [self.bodyFileOutputStream close];
    self.bodyFileOutputStream = nil;
    
    NSError *fileReadError = nil;
    NSDictionary *fileAttrs = [[NSFileManager defaultManager] attributesOfItemAtPath:self.pathToBodyFile error:&fileReadError];
    NSAssert1((fileAttrs != nil), @"Couldn't read post body file;", fileReadError);
    NSNumber *contentLength = [fileAttrs objectForKey:NSFileSize];
    NSLog(@"Body length %@", [contentLength stringValue]);
    [self setValue:[contentLength stringValue] forHTTPHeaderField:@"Content-Length"];
    
    NSLog(@"Setting bodyStream from %@", self.pathToBodyFile);
    NSInputStream *bodyStream = [[NSInputStream alloc] initWithFileAtPath:self.pathToBodyFile];
    [self setHTTPBodyStream:bodyStream];
    [bodyStream release];
}

- (NSInteger)appendBodyString:(NSString *)string {
    [self startRequestBody];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self.bodyFileOutputStream write:[data bytes] maxLength:[data length]];
}

- (NSString *)preparedBoundary {
    NSString *boundaryFormat =  self.firstBoundaryWritten ? @"\r\n--%@\r\n" : @"--%@\r\n";
    self.firstBoundaryWritten = YES;
    return [NSString stringWithFormat:boundaryFormat, self.HTTPBoundary];
}

- (void)prepareForUploadWithCompletionBlock:(PRPBodyCompletionBlock)completion
                                 errorBlock:(PRPBodyErrorBlock)error {
    self.prepCompletionBlock = completion;
    self.prepErrorBlock = error;
    
    [self startRequestBody];

    NSMutableString *params = [NSMutableString string];
    NSArray *keys = [self.formParameters allKeys];
    for (NSString *key in keys) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        [params appendString:[self preparedBoundary]];
        NSString *fmt = @"Content-Disposition: form-data; name=\"%@\"\r\n\r\n";
        [params appendFormat:fmt, key];
        [params appendFormat:@"%@", [self.formParameters objectForKey:key]];
        [pool release];
    }
    if ([params length]) {
        if ([self appendBodyString:params] == -1) {
            self.prepErrorBlock(self, [self.bodyFileOutputStream streamError]);
            return;
        }        
    }
   
    if (self.fileToUpload) {
        NSMutableString *str = [[NSMutableString alloc] init];
        [str appendString:[self preparedBoundary]];
        [str appendString:@"Content-Disposition: form-data; "];
        [str appendFormat:@"name=\"%@\"; ", self.fileToUpload.nameParam];
        [str appendFormat:@"filename=\"%@\"\r\n", self.fileToUpload.fileName];
        NSString *contentType = self.fileToUpload.contentType;
        [str appendFormat:@"Content-Type: %@\r\n\r\n", contentType];
        [self appendBodyString:str];
        
        NSLog(@"Preparing to stream %@", self.fileToUpload.localPath);
        NSString *path = self.fileToUpload.localPath;
        NSInputStream *mediaInputStream = [[NSInputStream alloc] 
                                           initWithFileAtPath:path];
        self.uploadFileInputStream = mediaInputStream;
        [mediaInputStream release];
        
        [self.uploadFileInputStream setDelegate:self];
        [self.uploadFileInputStream scheduleInRunLoop:[NSRunLoop currentRunLoop]
                                              forMode:NSDefaultRunLoopMode];
        [self.uploadFileInputStream open];
    } else {
        [self handleStreamCompletion];
    }
}

#pragma mark -
#pragma mark Runloop handler for copying the upload file

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    uint8_t buf[1024*100];
    NSUInteger len = 0;
    switch(eventCode) {
        case NSStreamEventOpenCompleted:
            NSLog(@"Media file opened");
            break;
        case NSStreamEventHasBytesAvailable:
            len = [self.uploadFileInputStream read:buf maxLength:1024];
            if (len) {
                [self.bodyFileOutputStream write:buf maxLength:len];
            } else {
                NSLog(@"Buffer finished; wrote to %@", self.pathToBodyFile);
                [self handleStreamCompletion];
            }
            break;
        case NSStreamEventErrorOccurred:
            NSLog(@"ERROR piping image to body file %@", [stream streamError]);
            self.prepErrorBlock(self, [stream streamError]);
            break;
        default:
            NSLog(@"Unhandled stream event (%d)", eventCode);
            break;
    }
}

- (void)handleStreamCompletion {
    [self finishMediaInputStream];
    [self finishRequestBody];
    self.prepCompletionBlock(self);
}

- (void)finishMediaInputStream {
    [self.uploadFileInputStream close];
    [self.uploadFileInputStream removeFromRunLoop:[NSRunLoop currentRunLoop] 
                                          forMode:NSDefaultRunLoopMode];
    self.uploadFileInputStream = nil;
}

- (void)handleStreamError:(NSError *)error {
    [self finishMediaInputStream];
    self.prepErrorBlock(self, error);
}

#pragma mark -
#pragma mark Accessors
- (NSString *)HTTPBoundary {
    NSAssert2(([HTTPBoundary length] > 0), @"-[%@ %@] Invalid or nil HTTPBoundary", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return HTTPBoundary;
}

- (void)setHTTPBoundary:(NSString *)boundary {
    if (HTTPBoundary == nil) {
        HTTPBoundary = [boundary copy];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:[NSString stringWithFormat:@"HTTPBoundary cannot be changed once set (old='%@' new='%@')", HTTPBoundary, boundary]
                                     userInfo:nil];
    }
}

@end

@implementation PRPUploadFileInfo

@synthesize localPath, contentType, nameParam, fileName;

- (NSString *)fileName {
    if (fileName == nil) {
        return [localPath lastPathComponent];
    }
    return fileName;
}

- (void)dealloc {
    [localPath release], localPath = nil;
    [contentType release], contentType = nil;
    [nameParam release], nameParam = nil;
    [fileName release], fileName = nil;
    
    [super dealloc];
}

@end