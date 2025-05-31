git submodule update --init

cd aws-nitro-enclaves-cli
cargo build
cp target/debug/nitro-cli ../
