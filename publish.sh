# Format and generate docs
grain doc ./reaper.gr -o ./reaper.md --current-version=v0.1.0
grain format ./ -o ./
# Clean
rm *.gr.wasm