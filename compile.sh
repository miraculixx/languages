
clang -O3 c/code.c -o c/code
clang++ -std=c++23 -march=native -O3 -Ofast -o cpp/code cpp/code.cpp
go build -ldflags "-s -w" -o go/code go/code.go
javac jvm/code.java
bun build --bytecode --compile js/code.js --outfile js/bun
native-image -O3 jvm.code
RUSTFLAGS="-Zlocation-detail=none" cargo +nightly build --manifest-path rust/Cargo.toml --release
cargo build --manifest-path rust/Cargo.toml --release
kotlinc -include-runtime kotlin/code.kt -d kotlin/code.jar
kotlinc-native kotlin/code.kt -o kotlin/code -opt
dart compile exe dart/code.dart -o dart/code --target-os=macos
cd inko && inko build --opt=aggressive code.inko -o code && cd ..
nim c -d:danger --opt:speed -d:passC -x:off -a:off nim/code.nim
nim -d:release --threads:off --stackTrace:off --lineTrace:off --opt:speed -x:off -o:nim/code c nim/code.nim
sbcl --noinform --non-interactive --load "common-lisp/code.lisp" --build
fpc -O3 fpc/code.pas
crystal build -o crystal/code --release crystal/code.cr
scala-cli --power package scala/code.scala -f -o scala/code
ldc2 -O3 -release -boundscheck=off -mcpu=native flto=thin d/code.d
odin build odin/code.odin -o:speed -file -out:odin/code
clang -O3 -framework Foundation objc/code.m -o objc/code
gfortran -O3 fortran/code.f90 -o fortran/code
zig build-exe -O ReleaseFast -femit-bin=zig/code zig/code.zig
luajit -b lua/code.lua lua/code
swiftc -O -parse-as-library -Xcc -funroll-loops -Xcc -march=native -Xcc -ftree-vectorize -Xcc -ffast-math swift/code.swift -o swift/code
dotnet publish csharp -o csharp/code
dotnet publish fsharp -o fsharp/code
ghc -O2 -fllvm haskell/code.hs -o haskell/code || { echo "ghc: cannot compile with llvm backend; fallback to use default backend"; ghc -O2 haskell/code.hs -o haskell/code; }
v -prod -cc clang -d no_backtrace -gc none -o v/code v/code.v
emojicodec emojicode/code.emojic
echo '(compile-program "chez/code.ss")' | chez --optimize-level 3 -q
(cd clojure && mkdir -p classes && clojure -Sdeps '{:paths ["."]}' -M -e "(compile 'code)")
cobc -I /opt/homebrew/include/ -O -O2 -O3 -Os -x -o cobol/main cobol/main.cbl
lake build --dir lean4 
#dotnet publish fsharp -o fsharp/code-aot /p:PublishAot=true /p:OptimizationPreference=Speed
# haxe --class-path haxe -main Code --jvm haxe/code.jar # was getting errors running `haxelib install hxjava`
#dotnet publish csharp -o csharp/code-aot /p:PublishAot=true /p:OptimizationPreference=Speed
#gnatmake -O3 -gnat2022 -gnatp -flto ada/code.adb -D ada -o ada/code
