/**
 * @file Application/helloworld.app/main.m
 * @brief Example showing how to create a simple application that terminates
 * right after launching.
 *
 * This example demonstrates how to start an application with a custom delegate.
 */
#include <Application/Application.h>

//////////////////////////////////////////////////////////////////////////

@interface AppDelegate : NXObject <ApplicationDelegate>
@end

//////////////////////////////////////////////////////////////////////////

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(id)application {
  // Print out the arguments passed to the application
  NXLog(@"Application did finish launching with arguments: %@",
        [application args]);

  // Stop the application immediately after launching, without
  // an error code.
  [application terminate];
}

@end

//////////////////////////////////////////////////////////////////////////

// Initialize the NXApplication framework without any specific
// application capabilities.
int main(int argc, char *argv[]) {
  return NXApplicationMain(argc, argv, [AppDelegate class],
                           NXApplicationCapabilityNone);
}
