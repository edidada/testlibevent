CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 
OBJS =		src/testlibevent.o

LIBS =	-levent

TARGET =	testlibevent

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

src/testlibevent.o: libevent.cpp
	$(CXX) $(CXXFLAGS) -c src/libevent.cpp
all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
