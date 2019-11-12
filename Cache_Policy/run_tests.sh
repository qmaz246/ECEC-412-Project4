#!/bin/bash
echo "Starting test with both LRU and LFU"

echo "------------------------- Assoc = 4 ------------------------"
echo "--------------------- Cache Size = 128 ---------------------"

#echo "Setting up for LRU"
# Cache_Size = 128
sed -i 's/cache_size = [0-9;]\+/cache_size = 128;/g' Cache.c
# Assoc = 4
sed -i 's/assoc = [0-9;]\+/assoc = 4;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 256 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 256
sed -i 's/cache_size = [0-9;]\+/cache_size = 256;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 512 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 512
sed -i 's/cache_size = [0-9;]\+/cache_size = 512;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 1024 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 1024
sed -i 's/cache_size = [0-9;]\+/cache_size = 1024;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 2048-----------------"

#echo "Setting up for LRU"
# Cache_Size = 2048
sed -i 's/cache_size = [0-9;]\+/cache_size = 2048;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Assoc = 8 ------------------------"
echo "------------------------- Cache Size = 128 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 128
sed -i 's/cache_size = [0-9;]\+/cache_size = 128;/g' Cache.c
# Assoc = 8
sed -i 's/assoc = [0-9;]\+/assoc = 8;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 256 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 256
sed -i 's/cache_size = [0-9;]\+/cache_size = 256;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 512 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 512
sed -i 's/cache_size = [0-9;]\+/cache_size = 512;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 1024 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 1024
sed -i 's/cache_size = [0-9;]\+/cache_size = 1024;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 2048 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 2048
sed -i 's/cache_size = [0-9;]\+/cache_size = 2048;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Assoc = 16 ------------------------"
echo "------------------------- Cache Size = 128 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 128
sed -i 's/cache_size = [0-9;]\+/cache_size = 128;/g' Cache.c
# Assoc = 16
sed -i 's/assoc = [0-9;]\+/assoc = 16;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 256 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 256
sed -i 's/cache_size = [0-9;]\+/cache_size = 256;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 512 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 512
sed -i 's/cache_size = [0-9;]\+/cache_size = 512;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 1024 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 1024
sed -i 's/cache_size = [0-9;]\+/cache_size = 1024;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"

echo "------------------------- Cache Size = 2048 -----------------"

#echo "Setting up for LRU"
# Cache_Size = 2048
sed -i 's/cache_size = [0-9;]\+/cache_size = 2048;/g' Cache.c

sed -i 's_//#define LRU_#define LRU_g' Cache.h
sed -i 's_#define LFU_//#define LFU_g' Cache.h
#echo "Cleaning previous make file"
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
#echo "Setting up for LFU"
sed -i 's_//#define LFU_#define LFU_g' Cache.h
sed -i 's_#define LRU_//#define LRU_g' Cache.h
make clean
#echo "Making new executable"
make
echo "----Running cache policy test with mem_trace 1/3----"
./Main "../../../../ECEC-412/Project3/531.deepsjeng_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 2/3----"
./Main "../../../../ECEC-412/Project3/541.leela_r_llc.mem_trace"
echo ""
echo "----Running cache policy test with mem_trace 3/3----"
./Main "../../../../ECEC-412/Project3/548.exchange2_r_llc.mem_trace"
echo ""
#echo "Tests have completed"
