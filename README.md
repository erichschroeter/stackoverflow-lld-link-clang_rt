Minimal example to reproduce an issue when trying to link with `clang_rt.profile-x86_64.lib`.

```
DIR=build && cmake -E make_directory $DIR && cmake -E chdir $DIR cmake .. -G Ninja --toolchain cmake/Toolchains/clang-toolchain.cmake -DTEST_COVERAGE=ON
DIR=build && cmake --build $DIR --config Debug --target example-coverage
```

## Dependencies

- [CMake](https://cmake.org/download/)
- [Ninja](https://ninja-build.org/)
- [Visual Studio (Community)](https://visualstudio.microsoft.com/vs/community/)
    - The following command should install the components I'm using:
    - `./VisualStudioSetup.exe --locale en-US --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Component.VC.Llvm.Clang --add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang --add Microsoft.VisualStudio.Component.VC.Llvm.ClangToolset --add Microsoft.VisualStudio.Component.VC.CoreBuildTools --add Microsoft.VisualStudio.Component.VC.CMake.Project --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.VC.ATL --add Microsoft.VisualStudio.Component.Windows10SDK.19041`
    - Make sure to add the location for the clang executables to the `PATH`. For me it was:
        - `C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\bin`

## Error message

```
$> DIR=build && cmake --build $DIR --config Debug --target example-coverage
[2/3] Linking CXX executable example.exe
lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingFile.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(WindowsMMap.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingBuffer.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingPlatformWindows.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingMerge.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfiling.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingWriter.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingMergeFile.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingValue.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingInternal.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingUtil.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingNameVar.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory

lld-link: warning: Cannot use debug info for 'clang_rt.profile-i386.lib(InstrProfilingBiasVar.c.obj)' [LNK4099]
>>> failed to load reference 'D:\a\_work\1\s\Intermediate\vctools\libasan.nativeproj__384798980\objr\x86\projects\compiler-rt\lib\profile\CMakeFiles\clang_rt.profile-i386.dir\clang_rt.profile-i386.pdb': no such file or directory
[3/3] Running coverage for example...
FAILED: CMakeFiles/example-coverage C:/src/github/stackoverflow_test_coverage/build/CMakeFiles/example-coverage
cmd.exe /C "cd /D C:\src\github\stackoverflow_test_coverage\build && "C:\Program Files\CMake\bin\cmake.exe" -E env LLVM_PROFILE_FILE=example.profraw C:/src/github/stackoverflow_test_coverage/build/example.exe && "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\bin\llvm-profdata.exe" merge --sparse example.profraw --output example.profdata && "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\bin\llvm-cov.exe" report C:/src/github/stackoverflow_test_coverage/build/example.exe -instr-profile=example.profraw && C:\Users\erich\AppData\Roaming\Python\Python38\Scripts\gcovr.exe --cobertura-pretty example-coverage.xml -r C:/src/github/stackoverflow_test_coverage"
1 + 2 = 3
warning: example.profraw: unsupported instrumentation profile format version
error: no profile can be merged
ninja: build stopped: subcommand failed.
```
