BUILD_PATH=`pwd`
BUILD_TYPE=Release


if [ ! -d "ios/arm" ]; then
  mkdir -p ios/arm
fi
cd ios/arm
rm -rf *
cmake -DAPPLE=TRUE \
      -DCMAKE_OSX_SYSROOT=iphoneos \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=9.0 \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_OSX_ARCHITECTURES=armv7 \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      ${BUILD_PATH}/..
make

cd ${BUILD_PATH}
if [ ! -d "ios/arm64" ]; then
  mkdir -p ios/arm64
fi
cd ios/arm64
rm -rf *
cmake -DAPPLE=TRUE \
      -DCMAKE_OSX_SYSROOT=iphoneos \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=9.0 \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_OSX_ARCHITECTURES=arm64 \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      ${BUILD_PATH}/..
make

cd ${BUILD_PATH}
if [ ! -d "ios/x86_64" ]; then
  mkdir -p ios/x86_64
fi
cd ios/x86_64
rm -rf *
cmake -DAPPLE=TRUE \
      -DCMAKE_OSX_SYSROOT=iphonesimulator \
      -DCMAKE_OSX_DEPLOYMENT_TARGET=9.0 \
      -DCMAKE_C_COMPILER=clang \
      -DCMAKE_OSX_ARCHITECTURES=x86_64 \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      ${BUILD_PATH}/..
make

cd ../

rm -rf *.dylib *.a

lipo -create arm/libuv.1.0.0.dylib arm64/libuv.1.0.0.dylib x86_64/libuv.1.0.0.dylib -output ./libuv.1.0.0.dylib
ln -s libuv.1.0.0.dylib libuv.1.dylib
# ln -s libuv.1.dylib libuv.dylib

lipo -create arm/libuv_a.a arm64/libuv_a.a x86_64/libuv_a.a -output ./libuv_a.a

cd ${BUILD_PATH}