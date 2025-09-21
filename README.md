# DVD Screensaver for MacOS

A screensaver for macOS that recreates the nostalgic DVD screensaver!

This is a recreation of Brian Tracy's DVD screensaver. (If you would like to go to that page, click [here](https://github.com/briantracy/DVDScreenSaver/tree/master)) It is just tweaked to be smoother and more suitable for modern macOS versions.

# Installation Process

To install on your Mac, download and unzip the bouncesaver.saver.zip file. You will find a bouncesaver.saver file. Open it, and your System Settings will prompt you to install it. If it says that the developer isn't trusted, head to Settings -> Privacy and Security, scroll down to the bottom, and click Open Anyway. 

# Editing the Screensaver to Your Own Preference

If you would like to tweak the screensaver to your own liking, click the Code button on GitHub, and click Download Zip. You will find a folder containing all the code you need. At this point, make sure you have Xcode installed. Open the file bouncesaver.xcodeproj, and the code will open up in Xcode. Once you have finished tweaking the code, press Command + B to build your new code.

If you encounter an error saying "Multiple commands product" and Xcode saying your build failed, navigate to the left-hand sidebar and click bouncesaver -> Build Phases. You will find a "Copy Files" dropdown. Click on the dropdown, and you will probably find a dvdlogo.png file. Click on the trash button and delete the file. Now, on your menu bar, navigate to Product -> Hold down Option Key -> Clean Build Folder. Now rebuild. 

Now, you should be able to find the screensaver if you search in your Finder. If you can't, in your menu bar, go to: Xcode -> Settings -> Locations. There is an arrow that directs you to the Derived Data folder. You should find another nested folder called bouncesaver-XXXXXX (your project name). Now navigate to Build -> Products -> Debug -> bouncesaver.saver. Now open the .saver file and install it again.

You have now successfully made your own tweaked screensaver!

