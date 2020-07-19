#!/bin/bash
set -e

catkin_make -DCMAKE_BUILD_TYPE=Release
catkin_make -DCMAKE_BUILD_TYPE=Release tests

if [ $# -eq 0 ]
then
	catkin_make -DCMAKE_BUILD_TYPE=Release run_tests -j1
else

	for pkg in "$@"
	do
		catkin_make -DCMAKE_BUILD_TYPE=Release run_tests_$pkg -j1
	done
fi
catkin_test_results build/test_results

