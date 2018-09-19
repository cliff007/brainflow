#!/bin/bash

if [ -d build ]; then
  	rm -rf build
fi
mkdir build
cd build

if [[ "$@" == "EMULATOR" ]]
then
	echo "Build emulator mode"
    cmake -DEMULATOR=1 ..
else
	echo "Build plain"
    cmake ..
fi

cmake --build .
cd ..

# python
cp ./compiled/libBoardController.so ./python-package/brainflow/lib/libBoardController.so
# cpp
cp ./compiled/libBoardController.so ./cpp-package/lib/libBoardController.so
cp ./src/board_controller/inc/board_controller.h  ./cpp-package/inc/board_controller.h