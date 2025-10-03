# example of wasm-bindgen error with nix wasm-bindgen-cli version mismatch

the version of wasm-bindgen in the project is 0.2.104 while in nix it is 0.2.100

in this example, we've indicated to cargo that `cargo test` should use the
wasm-bindgen test runner. the test runner will try to compile unit tests to
web-assembly with `wasm-bindgen-cli` but fail, since the project version is on
`0.2.104` but nix is on `0.2.100`

running `cargo test --target wasm32-unknown-unknown` will produce this error:

```
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.03s
     Running unittests src/lib.rs (target/wasm32-unknown-unknown/debug/deps/wasm_example-7b8672d981e81853.wasm)
Error: executing `wasm-bindgen` over the Wasm file

Caused by:


    it looks like the Rust project used to create this Wasm file was linked against
    version of wasm-bindgen that uses a different bindgen format than this binary:

      rust Wasm file schema version: 0.2.104
         this binary schema version: 0.2.100

    Currently the bindgen format is unstable enough that these two schema versions
    must exactly match. You can accomplish this by either updating this binary or
    the wasm-bindgen dependency in the Rust project.

    You should be able to update the wasm-bindgen dependency with:

        cargo update -p wasm-bindgen --precise 0.2.100

    don't forget to recompile your Wasm file! Alternatively, you can update the
    binary with:

        cargo install -f wasm-bindgen-cli --version 0.2.104

    if this warning fails to go away though and you're not sure what to do feel free
    to open an issue at https://github.com/rustwasm/wasm-bindgen/issues!

error: test failed, to rerun pass `--lib`

Caused by:
  process didn't exit successfully: `wasm-bindgen-test-runner /home/insipx/code/insipx/wasm-example/target/wasm32-unknown-unknown/debug/deps/wasm_example-7b8672d981e81853.wasm` (exit status: 1)
note: test exited abnormally; to see the full output pass --nocapture to the harness.
```
