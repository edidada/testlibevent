CXXFLAGS =	-O2 -g -Wall -fmessage-length=0 
OBJS =		libevent.o

LIBS =	-levent

TARGET =	testlibevent

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
