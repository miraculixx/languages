#!/bin/bash

# Function to add a program to the global array
add() {
    names+=("$1")
    programs+=("$2 $3")
}

# Function to run hyperfine for all programs in the global array
run() {
  for name in "${names[@]}"; do
    hyperfine_name_args+=("-n '$name'")
  done
  for program in "${programs[@]}"; do
    hyperfine_program_args+=("'$program'")
  done
  cmd="hyperfine -i --runs 3 --warmup 2 --export-json reports.json "${hyperfine_name_args[@]}" "${hyperfine_program_args[@]}""
  echo "[INFO] running $cmd"
  eval $cmd
}

plot() {
  echo "[INFO] plotting..."
  pip install matplotlib
  python ../create_plot.py reports.json
}

# specify what to run
run "Zig" "" "./zig/code"
run "C" "" "./c/code"
run "Rust" "" "./rust/target/release/code"
run "Emojicode" "" "./emojicode/code"
run "Dart" "" "./dart/code"
run "Objective-C" "" "./objc/code"
run "Kotlin JVM" "java -jar" "kotlin/code.jar"
run "Kotlin Native" "" "./kotlin/code.kexe"
run "Node" "node" "./js/code.js"
run "Bun" "bun" "./js/code.js"
run "Bun (Compiled)" "" "./js/bun"
run "Deno" "deno" "./js/code.js"
run "PyPy" "pypy" "./py/code.py"
run "CPP" "" "./cpp/code"
run "Go" "" "./go/code"
run "Node (jitless)" "node --jitless" "./js/code.js"
run "Bun (jitless)" "bun" "./js/code.js" "BUN_JSC_useJIT=0"
run "Deno (jitless)" "deno --v8-flags=--jitless" "./js/code.js"
run "Java" "java" "jvm.code"
run "Scala" "" "./scala/code"
run "Ruby" "ruby" "./ruby/code.rb"
run "PHP JIT" "php -dopcache.enable_cli=1 -dopcache.jit=on -dopcache.jit_buffer_size=64M" "./php/code.php"
run "PHP" "php" "./php/code.php"
run "R" "Rscript" "./r/code.R"
run "Python" "python3.13" "./py/code.py"
run "Common Lisp" "" "common-lisp/code"
run "Inko" "" "./inko/code"
run "Nim" "" "./nim/code"
run "Free Pascal" "" "./fpc/code"
run "Crystal" "" "./crystal/code"
run "Odin" "" "./odin/code"
run "Fortran" "" "./fortran/code"
run "LuaJIT" "luajit" "./lua/code"
run "Lua" "lua" "./lua/code.lua"
run "Swift" "" "./swift/code"
run "Julia" "julia" "./julia/code.jl"
run "Elixir" "elixir" "elixir/bench.exs"
run "C#" "" "./csharp/code/code"
run "F#" "" "./fsharp/code/code"
run "Ruby" "ruby" "./ruby/code.rb"
run "Ruby YJIT" "miniruby --yjit" "./ruby/code.rb"
run "Haskell" "" "./hs/code"
run "V" "" "./v/code"
run "Chez Scheme" "chez --program" "./chez/code.so"
run "AWK" "awk -f" "./awk/code.awk"
run "MAWK" "mawk -f" "./awk/code.awk"
run "Clojure" "java -cp clojure/classes:$(clojure -Spath)" "./clojure/code"
run "Babashka" "bb -cp clojure -m" "./babashka/code"
run "COBOL" "" "./cobol/main"
run "Octave" "octave ./octave/code.m 40"
run "Babashka" "bb" "bb/code.clj"
#run "F# AOT" "./fsharp/code-aot/code"
#run "C# AOT" "./csharp/code-aot/code"
#run "Haxe JVM" "java -jar haxe/code.jar" # was getting errors running `haxelib install hxjava`
#run "Ada" "./ada/code"
#run "D" "./d/code" # Seems to not have an arm / M1 version
#run "Java GraalVM" "./jvm.code"
# run everything
run
plot

echo "[INFO] done"
