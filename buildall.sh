echo "Welcome to the meower CL build script"

echo "Building windows..."
deno task build-win

echo "Building mac..."
deno task build-mac-x86
deno task build-mac-arm

echo "Building linux..."
deno task build-linux-x86
deno task build-linux-arm

echo "All platforms built, starting compression"

mkdir build/compressed

zip build/compressed/win.zip build/win.exe
zip build/compressed/mac.zip build/mac-x86 build/mac-arm

tar -kczf build/compressed/linux.tar.gz build/linux-x86 build/linux-arm
echo "All builds compressed, build finished"