NVMSRC_DIR = /home/terry/workspace/nvthreads/src
NVMINC_DIR = /home/terry/workspace/nvthreads/include
INC_DIR = /home/terry/workspace/nvthreads/third-parties/dthreads/src/include
SRC_DIR = /home/terry/workspace/nvthreads/third-parties/dthreads/src/source

SRCS = /home/terry/workspace/nvthreads/api/src/nvrecovery.cpp $(NVMSRC_DIR)/nvm.cpp $(NVMSRC_DIR)/logger.cpp $(SRC_DIR)/libdthread.cpp $(SRC_DIR)/xrun.cpp $(SRC_DIR)/xthread.cpp $(SRC_DIR)/xmemory.cpp $(SRC_DIR)/prof.cpp $(SRC_DIR)/real.cpp 
DEPS = $(SRCS) $(INC_DIR)/xpersist.h $(INC_DIR)/xdefines.h $(INC_DIR)/xglobals.h $(INC_DIR)/xpersist.h $(INC_DIR)/xplock.h $(INC_DIR)/xrun.h $(INC_DIR)/warpheap.h $(INC_DIR)/xadaptheap.h $(INC_DIR)/xoneheap.h

INCLUDE_DIRS = -I/home/terry/workspace/nvthreads/api/include -I$(INC_DIR) -I$(INC_DIR)/heaplayers -I$(INC_DIR)/heaplayers/util -I$(NVMINC_DIR)

#TARGETS = libdthread.so libdthread32.so
TARGETS = libnvthread.so


all: $(TARGETS)

CXX = g++

# Check deterministic schedule
# -DCHECK_SCHEDULE

# Get some characteristics about running.
# -DGET_CHARACTERISTICS

CFLAGS32 = -std=gnu++11 -g -m32 -msse2 -DX86_32BIT -DSSE_SUPPORT -O3 -DNDEBUG -shared -fPIC -DLAZY_COMMIT -DLOCK_OWNERSHIP -DDETERM_MEMORY_ALLOC -D'CUSTOM_PREFIX(x)=grace\#\#x'

CFLAGS64 = -std=gnu++11 -g -m64 -msse2 -O3 -DNDEBUG -shared -fPIC -DLAZY_COMMIT -DLOCK_OWNERSHIP -DDETERM_MEMORY_ALLOC -D'CUSTOM_PREFIX(x)=grace\#\#x'
#CFLAGS64 = -g -m64 -msse2 -O3 -DNDEBUG -shared -fPIC -DTRACING -DDEBUG -DLOCK_OWNERSHIP -DDETERM_MEMORY_ALLOC -D'CUSTOM_PREFIX(x)=grace\#\#x'

LIBS = -ldl -lpthread

libnvthread32.so: $(SRCS) $(DEPS) Makefile
	$(CXX) $(CFLAGS32) $(INCLUDE_DIRS) $(SRCS) -o $@ $(LIBS)

libnvthread.so: $(SRCS) $(DEPS) Makefile
	$(CXX) $(CFLAGS64) $(INCLUDE_DIRS) $(SRCS) -o $@ $(LIBS)


clean:
	rm -f $(TARGETS)

