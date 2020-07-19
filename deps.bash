#!/bin/bash
rosdep update
rosdep install --from-paths src --ignore-src -r
