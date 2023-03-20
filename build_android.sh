BUILD_PATH=`pwd`
ANDROID_NDK=/Users/haibingtang/Library/Android/sdk/ndk/21.1.6352462
BUILD_TYPE=Release


# if [ ! -d "android/arm" ]; then
#   mkdir -p android/arm
# fi
# cd android/arm
# rm -rf *
# cmake -DCMAKE_SYSTEM_NAME=Android \
#       -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake \
#       -DANDROID_ABI="armeabi-v7a" \
#       -DANDROID_NATIVE_API_LEVEL=21 \
#       -DANDROID_PLATFORM=android-21 \
#       -DANDROID_STL=c++_static \
#       -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
#       ${BUILD_PATH}/..
# make

# cd ${BUILD_PATH}
# if [ ! -d "android/arm64" ]; then
#   mkdir -p android/arm64
# fi
# cd android/arm64
# rm -rf *
# cmake -DCMAKE_SYSTEM_NAME=Android \
#       -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake \
#       -DANDROID_ABI="arm64-v8a" \
#       -DANDROID_NATIVE_API_LEVEL=21 \
#       -DANDROID_PLATFORM=android-21 \
#       -DANDROID_STL=c++_static \
#       -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
#       ${BUILD_PATH}/..
# make

cd ${BUILD_PATH}
if [ ! -d "android/x86_64" ]; then
  mkdir -p android/x86_64
fi
cd android/x86_64
rm -rf *
cmake -DCMAKE_SYSTEM_NAME=Android \
      -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI="x86_64" \
      -DANDROID_NATIVE_API_LEVEL=21 \
      -DANDROID_PLATFORM=android-21 \
      -DANDROID_STL=c++_static \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      ${BUILD_PATH}/..
make

cd ${BUILD_PATH}