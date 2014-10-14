.PHONY: all clean
EXE = aladdin

MACHINE_MODEL_OBJS = BaseDatapath.o ScratchpadDatapath.o Scratchpad.o
UTILS_OBJS = file_func.o generic_func.o opcode_func.o
DDDG_OBJS = dddg.o
OBJS = $(MACHINE_MODEL_OBJS) $(UTILS_OBJS) $(DDDG_OBJS)

CFLAGS = -c -m32 $(DEBUG) -O2 -std=c++0x -I$(BOOST_ROOT)
LFLAGS = $(DEBUG) -lz -L$(BOOST_ROOT)/stage/lib  -lboost_graph -lboost_regex

all : $(EXE)

$(EXE): $(OBJS)
	$(CXX) $(CFLAGS) aladdin.cpp
	$(CXX) -m32 -o $(EXE) $(EXE).o $(OBJS) $(LFLAGS)

%.o : %.h %.cpp
	$(CXX) $(CFLAGS) $*.cpp

clean:
	rm -f *.o
	rm -f aladdin
