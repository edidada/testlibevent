CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 
OBJS =		libeventmain.o

LIBS =	-levent

TARGET =	testlibevent

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

libeventmain.o:
	$(CXX) $(CXXFLAGS) -c src/libeventmain.cpp
all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
