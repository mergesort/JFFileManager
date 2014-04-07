JFFileManager
=============

Class methods which make dealing with files on iOS easier.



How To Install It 
-----------------

install by cocoapods : 

    pod 'JFFileManager', '~> 1.0.2'

install by manual

    drag and drop JFFileManager.h/m files into the project.



How To Use It
-------------

    import 'JFFileManager.h'

    //just call the methods

    [JFFileManager documentsDirectory];//return the document directory of the application



API
------------


    /**
     A file location for an application's main bundle.
     */
    + (NSString *)mainBundleDirectory;

    /**
     A file location for an application's caches directory.
     */
    + (NSString *)cachesDirectory;

    /**
     A file location for an application's documents directory.
     */
    + (NSString *)documentsDirectory;

    /**
     A file location for an application's temporary directory.
     */
    + (NSString *)temporaryDirectory;

    /**
     A file location for serializing an application's user object to disk.
     */
    + (NSString *)userFile;

    /**
     A file location for an application's main bundle
     
     @param fileData The data to write to a file.
     @param path The path to write the data to.
     @return BOOL Whether or not th file was created.
     */
    + (BOOL)createFile:(NSData *)fileData atPath:(NSString *)path;

    /**
     A file location for an application's main bundle
     
     @param path The path to remove the file from.
     @return BOOL Whether or not the file was deleted.
     */
    + (BOOL)removeFileAtPath:(NSString *)path;

    + (NSString *)contentsOfFileAtPath:(NSString *)path;

    /**
     Create directory for an application's main bundle 
     
     @param directoryName is the name of the directory which you wanna create 
     @param filePath can be any directory paths of the application
     return BOOL Whether or not the directory was created
     
     */

    + (BOOL)createDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath;

    /**
     Delete directory for an application's main bundle
     
     @param directoryName is the name of the directory which you wanna delete
     @param filePath can be any directory paths of the application
     return BOOL Whether or not the directory was deleted
     
     */

    + (BOOL)deleteDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath;

    @end


Support
-----------

    You can use it if your iOS app running >= iOS5 
