# testlibevent

- OS:ubuntu
- IDE:eclipse

libevent 版本

## win

```cmake
option(EVENT__DISABLE_OPENSSL
    "Define if libevent should build without support for OpenSSL encryption" OFF)
option(EVENT__DISABLE_BENCHMARK
    "Defines if libevent should build without the benchmark executables" OFF)
option(EVENT__DISABLE_TESTS
    "If tests should be compiled or not" OFF)
```

要禁用 SSL 支持并使用 CMake 构建 libevent，可以通过命令行传递选项来配置 CMake。你可以在命令行中执行以下步骤：

1. **创建并进入构建目录**（通常在源代码目录之外，以保持源代码目录的整洁）：
    ```sh
    mkdir build
    cd build
    ```

2. **运行 CMake 配置命令**，同时禁用 SSL 支持：
    ```sh
    cmake -DEVENT__DISABLE_OPENSSL=ON ..
    ```

3. **构建项目**：
    ```sh
    make
    ```

4. （可选）**安装构建好的库**：
    ```sh
    sudo make install
    ```

完整的命令行流程如下：
```sh
mkdir build
cd build
cmake -DEVENT__DISABLE_OPENSSL=ON ..
make
sudo make install
```

这样，libevent 将在没有SSL支持的情况下进行构建。

cmake -DEVENT__DISABLE_OPENSSL=ON -DEVENT__DISABLE_BENCHMARK=ON ..

上面哪些写cmake 的，D:\git\github\testlibevent\cmake-build-debug\_deps\libevent-build\bin\Debug\event.dll存在，报错 D:\git\github\testlibevent\cmake-build-debug\Debug\testlibevent.exe 链接不到event.dll

```cmake
EXEC : CMake error : cmake version 3.26.4 [D:\git\github\testlibevent\cmake-build-debug\testlibevent.vcxproj]
  Usage: C:\Users\edida\AppData\Local\Programs\CLion\bin\cmake\win\x64\bin\cmake.exe -E <command> [arguments...]
  Available commands: 
    capabilities              - Report capabilities built into cmake in JSON format
    cat [--] <files>...       - concat the files and print them to the standard output
    chdir dir cmd [args...]   - run command in a given directory
    compare_files [--ignore-eol] file1 file2
                                - check if file1 is same as file2
    copy <file>... destination  - copy files to destination (either file or directory)
    copy_directory <dir>... destination   - copy content of <dir>... directories to 'destination' directory
    copy_directory_if_different <dir>... destination   - copy changed content of <dir>... directories to 'destination' directory
    copy_if_different <file>... destination  - copy files if it has changed
    echo [<string>...]        - displays arguments as text
    echo_append [<string>...] - displays arguments as text but no new line
    env [--unset=NAME ...] [NAME=VALUE ...] [--] <command> [<arg>...]
                              - run command in a modified environment
    environment               - display the current environment
    make_directory <dir>...   - create parent and <dir> directories
    md5sum <file>...          - create MD5 checksum of files
    sha1sum <file>...         - create SHA1 checksum of files
    sha224sum <file>...       - create SHA224 checksum of files
    sha256sum <file>...       - create SHA256 checksum of files
    sha384sum <file>...       - create SHA384 checksum of files
    sha512sum <file>...       - create SHA512 checksum of files
    remove [-f] <file>...     - remove the file(s), use -f to force it (deprecated: use rm instead)
    remove_directory <dir>... - remove directories and their contents (deprecated: use rm instead)
    rename oldname newname    - rename a file or directory (on one volume)
    rm [-rRf] [--] <file/dir>... - remove files or directories, use -f to force it, r or R to remove directories and their contents recursively
    sleep <number>...         - sleep for given number of seconds
    tar [cxt][vf][zjJ] file.tar [file/dir1 file/dir2 ...]
                              - create or extract a tar or zip archive
    time command [args...]    - run command and display elapsed time
    touch <file>...           - touch a <file>.
    touch_nocreate <file>...  - touch a <file> but do not create it.
    create_symlink old new    - create a symbolic link new -> old
    create_hardlink old new   - create a hard link new -> old
    true                      - do nothing with an exit code of 0
    false                     - do nothing with an exit code of 1
  Available on Windows only:
    delete_regv key           - delete registry value
    env_vs8_wince sdkname     - displays a batch file which sets the environment for the provided Windows CE SDK installed in VS2005
    env_vs9_wince sdkname     - displays a batch file which sets the environment for the provided Windows CE SDK installed in VS2008
    write_regv key value      - write registry value
  
C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Microsoft\VC\v170\Microsoft.CppCommon.targets(166,5): error MSB3073: 命令“setlocal [D:\git\github\testlibevent\cmake-build-debug\testlibevent.vcxproj]
```

### conan

### vcpkg
Computing installation plan...
The following packages are already installed:
libevent[core,thread]:x64-windows@2.1.12+20230128#1

## mac clion
/Users/ibqo/CLionProjects/testlibevent/src/libevent.cpp:30:10: fatal error: 'event2/bufferevent.h' file not found

```shell
brew install libevent
Warning: libevent 2.1.12 is already installed and up-to-date.
To reinstall 2.1.12, run:
brew reinstall libevent
```



