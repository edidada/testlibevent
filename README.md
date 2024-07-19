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



