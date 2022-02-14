.SUFFIXES:
.SUFFIXES: .cpp .o

PROGRAM = tetris

SHELL = /bin/sh

CXXFLAGS =
LDFLAGS =

SRCDIR = src
OBJDIR = obj
SRCFILES = $(wildcard $(SRCDIR)/*.cpp)
OBJFILES = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SRCFILES))

.PHONY: all
all: $(PROGRAM)

$(PROGRAM): $(OBJFILES)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

.PHONY: clean
clean:
	test -z $(PROGRAM) || rm -f $(PROGRAM)
	rm -f $(OBJDIR)/*.o